//
//  YPAboutUsViewController.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPAboutUsViewController.h"
#import "YPAboutUsViewModel.h"
#import "YPAboutUsProxy.h"
#import "YPAboutUsTableViewCell.h"
#import "Masonry.h"

@interface YPAboutUsViewController () <YPAboutUsViewModelDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YPAboutUsViewModel *viewModel;
@property (nonatomic, strong) YPAboutUsProxy *proxy;

@end

@implementation YPAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ls_about_us".yp_localizedString;
    
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

#pragma mark - YPAboutUsViewModelDelegate

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
            [YPAboutUsTableViewCell class],
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

- (YPAboutUsProxy *)proxy {
    if (!_proxy) {
        _proxy = [[YPAboutUsProxy alloc] initWithViewModel:self.viewModel];
    }
    return _proxy;
}

- (YPAboutUsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[YPAboutUsViewModel alloc] init];
        _viewModel.delegate = self;
    }
    return _viewModel;
}

@end
