//
//  ViewController.m
//  TextureDemo
//
//  Created by lanfeng on 2017/7/31.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "ViewController.h"
#import "LFTestOneViewController.h"
#import "LFTestTwoViewController.h"

@interface ViewController ()<ASTableDelegate, ASTableDataSource>
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) NSMutableArray *models;



@end

@implementation ViewController

- (instancetype)init {
    if (self = [super initWithNode:[ASDisplayNode new]]) {
        
        [self.node addSubnode:self.tableNode];
        
        [self.tableNode reloadData];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"%@, %@", NSStringFromCGRect(self.tableNode.frame), NSStringFromCGRect(self.node.bounds));
    self.tableNode.frame = self.node.bounds;
}

- (void)lf_loadMoreData {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%d", indexPath.row);
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[LFTestOneViewController alloc] init] animated:YES];
    } else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[[LFTestTwoViewController alloc] init] animated:YES];
    }
}

- (BOOL)shouldBatchFetchForTableView:(ASTableView *)tableView
{
    return self.models.count;
}

- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode {
    return 1;
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.models[indexPath.row];
    ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
        ASTextCellNode *textcell = [[ASTextCellNode alloc] init];
        textcell.selectionStyle = UITableViewCellSelectionStyleNone;
        textcell.text = title;
        return textcell;
    };
    return cellNodeBlock;
}

#pragma  mark - getters and setters
- (ASTableNode *)tableNode {
    if (!_tableNode) {
        _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
        _tableNode.delegate = self;
        _tableNode.dataSource = self;
    }
    return _tableNode;
}

- (NSMutableArray *)models {
    if (!_models) {
        _models = [[NSMutableArray alloc] init];
        [_models addObjectsFromArray:@[@"例子1", @"例子2"]];
    }
    return _models;
}

@end
