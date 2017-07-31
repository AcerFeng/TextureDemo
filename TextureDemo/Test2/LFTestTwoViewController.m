//
//  LFTestTwoViewController.m
//  TextureDemo
//
//  Created by lanfeng on 2017/7/31.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "LFTestTwoViewController.h"
#import "TestOneModel.h"
#import "LFTestTwoTableViewCell.h"
#import <ReactiveCocoa.h>

@interface LFTestTwoViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *models;
@end

@implementation LFTestTwoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    
    
    [self lf_loadNext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
- (void)lf_loadNext {
    @weakify(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self);
        if (self.models.count > 50) {
            [self.tableView reloadData];
            return;
        } else {
            
        }
        
        //        for (int i = 0; i < (arc4random() % 2 == 0 ? 20 : 15); i++) {
        //            [self.models addObject:[self getOneModel]];
        //            [self.tableNode reloadData];
        //        }
        for (int i = 0; i < 50; i++) {
            [self.models addObject:[self getOneModel]];
            [self.tableView reloadData];
        }
        
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestOneModel *model = self.models[indexPath.row];
    LFTestTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LFTestTwoTableViewCell class])];
    [cell configWithModel:model];
    return cell;
}

#pragma mark - getters and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[LFTestTwoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([LFTestTwoTableViewCell class])];
        _tableView.estimatedRowHeight = 50;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

- (NSMutableArray *)models {
    if (!_models) {
        _models = [[NSMutableArray alloc] init];
    }
    return _models;
}

- (TestOneModel *)getOneModel {
    TestOneModel *model = [[TestOneModel alloc] init];
    switch (arc4random() % 5) {
        case 0:
            model.title = @"开始的疯狂时刻到了附肥看看接口肥看看接口近阿拉山口点击是；打卡机开始的减肥看看接口连接";
            model.image = @"https://static.wang-guanjia.com/static/img/360//Content/UploadFile/fe7c4beb-b098-470e-9cbe-536391019590/b067ab23-4782-4e12-847b-34823f4ab1a2..jpg";
            model.smallImage = @"https://static.wang-guanjia.com/static/img/360//Content/UploadFile/64531847-be78-458a-bfb0-df750f7939ea/28acf572-d461-44da-b56b-349b70beb47c..jpg";
            break;
        case 1:
            model.title = @"开始的疯狂时刻到了附近阿拉山口点击是；打卡机开始的减肥看看接口连接";
            model.image = @"https://static.wang-guanjia.com/static/img/360//Content/UploadFile/98e30ffd-3316-4377-8500-352cd028f7f2/94045d54-5eba-47e7-baea-d890e13aae3a..jpg";
//            model.smallImage = @"https://static.wang-guanjia.com/static/img/360//Content/UploadFile/ae0eb17e-0a7c-46c7-a833-b5e0bfc0af39/a817591c-2894-4a08-8fbf-856112466fd8..jpg";
            break;
        case 2:
//            model.title = @"阿开始的减肥看看接口连接";
            model.image = @"https://static.wang-guanjia.com/static/img/360//Content/UploadFile/98e30ffd-3316-4377-8500-352cd028f7f2/94045d54-5eba-47e7-baea-d890e13aae3a..jpg";
            model.smallImage = @"https://static.wang-guanjia.com/static/img/360//Content/UploadFile/74ceda73-2c78-4e6d-b12a-efe8f9118cd5/0ff6a410-7d58-4a1b-b22c-a5e9a0daead4..jpg";
            break;
        case 3:
//            model.title = @"开始的疯狂时刻到了附近阿拉山口点击是；打卡机开始的减肥看看接口连接";
            model.image = @"http://s.cimg.163.com/i/cms-bucket.nosdn.127.net/7f372fdd57084aca9e7d21e726ed001820170730183138.jpeg.750x20000.75.auto.jpg";
            model.smallImage = @"https://static.wang-guanjia.com/static/img/360//Content/UploadFile/a851f271-6057-469d-8ce6-97b21187860f/d816956a-7d03-408e-a0f1-7ca9a707065e..jpg";
            break;
        case 4:
//            model.image = @"";
            model.title = @"开始的疯狂时刻到了附近阿拉山口点击是；打卡机开始的减肥看看接口连接";
            break;
            
            
        default:
            break;
    }
    
//    model.image = arc4random() % 2 == 0 ? @"http://s.cimg.163.com/i/cms-bucket.nosdn.127.net/7f372fdd57084aca9e7d21e726ed001820170730183138.jpeg.750x20000.75.auto.jpg" : @"http://s.cimg.163.com/i/cms-bucket.nosdn.127.net/fe7013d95aec429b8c52bb242cab2ed320170730104133.jpeg.750x20000.75.auto.jpg";
//    model.title = arc4random() % 2 == 0 ? @"啥地方就是打发了盛开的积分了盛开的积分算了快递放假了科技受得了发卡机上的弗兰克骄傲了卡洛斯" : @"啥地方看见爱上了第三方历史快递费拉克丝江东父老凯撒大家纷纷拉送快递放假拉开距离控件考虑考虑解决了空间来看看见了看见萨克大嫁风尚东方斯卡拉打飞机";
    return model;
}

@end
