//
//  ViewController.m
//  stv_project 2.3.4
//
//  Created by 比留間龍三 on 2018/07/29.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "CustomTableViewCell.h"
#import "FMDB.h"
#import "TodoList.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic)  IBOutlet UITableView *todoTable;
@property (strong,nonatomic) NSMutableArray *todoLists;
@property (weak, nonatomic)  NSDate *date;
@property (weak, nonatomic)  NSString *setDay;
@property (weak, nonatomic)  NSIndexPath *deletePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.todoTable.delegate = self;
    self.todoTable.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [self fetchTodoList];
}

// 遷移
- (IBAction)toRegiBtn:(id)sender {
    RegisterViewController *regiView = [RegisterViewController new];
    UIStoryboard *secondStory = [UIStoryboard storyboardWithName:@"Register" bundle:[NSBundle mainBundle]];
    regiView = [secondStory instantiateInitialViewController];
    [self.navigationController pushViewController:regiView animated:YES];
}

// tableに対してdbよりデータを取ってくる
- (void)fetchTodoList {
    // db操作
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *filePath = [dir stringByAppendingPathComponent:@"tr_todo.db"];
    FMDatabase *fm = [FMDatabase databaseWithPath:filePath];
    
    NSLog(@"%@", NSHomeDirectory());
    
    // Table取得
    NSString *selectTableSql =
    @"SELECT todo_id, todo_title, limit_date FROM tr_todo WHERE delete_flg = 0 ORDER BY limit_date asc;";
    
    [fm open];
    
    FMResultSet *results =  [fm executeQuery:selectTableSql];
    self.todoLists = [NSMutableArray new];
    
    while ([results next]) {
        TodoList *todoList  = [TodoList new];
        todoList.todo_id    = [results intForColumn:@"todo_id"];
        todoList.todo_title = [results stringForColumn:@"todo_title"];
        todoList.limit_date = [results stringForColumn:@"limit_date"];
        
        [self.todoLists addObject:todoList];
    }
    [results close];
    [fm close];
    
    [self.todoTable reloadData];
}

// title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"ToDo List";
    return title;
}

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoLists.count;
}

// custom cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell =
    (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    TodoList *todoList = self.todoLists[indexPath.row];
    cell.readTitle.text = todoList.todo_title;
    cell.readLimit.text = todoList.limit_date;
    return cell;
}

@end
