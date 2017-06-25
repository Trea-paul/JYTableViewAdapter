//
//  HomeViewViewController.m
//  JYTableViewAdapter
//
//  Created by TreaPaul on 2017/6/25.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

/**
 *  JYTableViewController 示例用法
 *  数据交由viewModel负责绑定
 *  控制器负责接收事件回调
 *  cell样式可以继承JYTableViewCell自定义，也可以继承JYTableViewListCell中的使用通用控件
 *  最大限度的解除数据和界面关联，通过数据来改变界面
 */

#import "HomeViewViewController.h"
#import "HomeGoodsListTableListCell.h"
#import "HomeArticleTableViewListCell.h"
#import "HomeModel.h"
#import "JYWebViewController.h"

@interface HomeViewViewController () <JYTableViewControllerDelegate>

@property (nonatomic, strong) JYTableViewController *tableViewController;
@property (nonatomic, strong) JYTableViewModel *viewModel;

@property (nonatomic, strong) HomeModel *homeModel;

@end

@implementation HomeViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
    
    [self setupUI];
    
}

- (void)setupUI
{
    // 加载控制器
    self.tableViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    // 请求数据
    [self requestData];
    
}

- (JYTableViewController *)tableViewController
{
    if (!_tableViewController) {
        _tableViewController = [[JYTableViewController alloc] initWithStyle:UITableViewStylePlain];
        _tableViewController.view.userInteractionEnabled = YES;
        _tableViewController.delegate = self;
        _tableViewController.automaticallyAdjustsScrollViewInsets = YES;
        _tableViewController.tableView.backgroundView.backgroundColor = HexRGB(0xFFFFF0);
        [self addChildViewController:_tableViewController];
        [self.view addSubview:_tableViewController.view];
        
    }
    
    return _tableViewController;
}

- (HomeModel *)homeModel
{
    if (!_homeModel) {
        _homeModel = [[HomeModel alloc] init];
    }
    return _homeModel;
}


- (void)requestData
{
    [self.homeModel requestHomeData:^(HomeModel *homeModel) {
        
        if (homeModel.articleList.count) {
            
            
            // 请求完数据刷新TableView
            [self updateTableView];
            
        }
        
    }];
    
}


- (void)updateTableView
{
    self.viewModel = [[JYTableViewModel alloc] initWithStyle:UITableViewStylePlain sectionModelsBlock:^(NSMutableArray *sectionModels) {
        
       JYTableViewSectionModel *sectionModel = [[JYTableViewSectionModel alloc] initWithCellModelsBlock:^(NSMutableArray *cellModels) {
          
           for (ArticleModel *model in self.homeModel.articleList) {
               
               JYTableViewListCellModel *cellModel = [JYTableViewListCellModel new];
               cellModel.cellClass = [HomeArticleTableViewListCell class];
               cellModel.topLeftLbTitle     = model.title;
               cellModel.centerLeftLbTitle  = model.desc;
               cellModel.bottomLeftLbTitle  = [NSString stringWithFormat:@"阅读：%@", model.readCount];
               cellModel.bottomCenterLbTitle  = [NSString stringWithFormat:@"转发：%@", model.forwardCount];
               cellModel.value = model.Id;
               cellModel.linkUrl = model.url;
               cellModel.centerLeftImageName = model.imageUrl;
               
               
               /**
                * 确定Cell的高度有三种方法，以下按照优先级确定,默认为2
                * 1，在此指定rowHeight
                *
                * 需要依赖数据详细计算高度的可选下列两种方法，2为每次刷新都会调用， 3则只需计算一次
                * 2，在 HomeArticleTableViewListCell 中实现方法 + (CGFloat)cellHeightForCellModel:(JYTableViewCellModel *)cellModel
                *
                * 3，需要依赖数据详细计算高度的，在此传入模型 + (CGFloat)heightForRowWithModel:(id)model;
                */
                
               cellModel.rowHeight = 100.f;
//               cellModel.rowHeight = [HomeArticleTableViewListCell heightForRowWithModel:model];
               
               [cellModels addObject:cellModel];
               
           }
       }];
        
        [sectionModels addObject:sectionModel];
    }];
    
    self.tableViewController.viewModel = self.viewModel;
}


#pragma mark - JYTableviewDelegate
- (void)tableViewModel:(JYTableViewModel *)tableViewModel didSelectCellModel:(JYTableViewCellModel *)cellModel atIndexPath:(NSIndexPath *)indexPath
{
    JYWebViewController *webVC = [[JYWebViewController alloc] init];
    webVC.requestUrl = cellModel.linkUrl;
    [self.navigationController pushViewController:webVC animated:YES];
    
    
}

-(void)tableViewModel:(JYTableViewModel *)tableViewModel didTouchUpInsideButton:(UIButton *)button cellModel:(JYTableViewCellModel *)cellModel atIndexPath:(NSIndexPath *)indexPath
{
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
