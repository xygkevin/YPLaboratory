//
//  YPHomeViewController.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/17.
//

#import "YPHomeViewController.h"
#import "YPHomeViewModel.h"
#import "YPHomeProxy.h"
#import "YPHomeTableViewCell.h"
#import "Masonry.h"

@interface YPHomeViewController () <YPHomeViewModelDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YPHomeViewModel *viewModel;
@property (nonatomic, strong) YPHomeProxy *proxy;

@end

@implementation YPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    [self setupSubviews];
    [self startLoadData];
}

- (void)startLoadData {
    [self.viewModel startLoadData];
}

- (void)setupSubviews {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
}

#pragma mark - YPHomeViewModelDelegate

- (void)didEndLoadData:(BOOL)hasMore {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    if (hasMore) {
        [self.tableView.mj_footer resetNoMoreData];
    } else {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
    [self.tableView reloadData];
}

#pragma mark - getters | setters

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.delegate = self.proxy;
        tableView.dataSource = self.proxy;
        
        __weak typeof(self) weakSelf = self;
        tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            [weakSelf.viewModel loadMoreData];
        }];
        
        NSArray *classs = @[
            [UITableViewCell class],
            [YPHomeTableViewCell class],
        ];
        [classs enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tableView registerClass:obj forCellReuseIdentifier:NSStringFromClass(obj)];
        }];
        
        NSArray *headersClasss = @[];
        [headersClasss enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tableView registerClass:obj forHeaderFooterViewReuseIdentifier:NSStringFromClass(obj)];
        }];
        
        _tableView = tableView;
    }
    return _tableView;
}

- (YPHomeProxy *)proxy {
    if (!_proxy) {
        _proxy = [[YPHomeProxy alloc] initWithViewModel:self.viewModel];
    }
    return _proxy;
}

- (YPHomeViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[YPHomeViewModel alloc] init];
        _viewModel.delegate = self;
    }
    return _viewModel;
}

@end
