//
//  YPHomeProxy.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/17.
//

#import "YPHomeProxy.h"
#import "YPHomeViewModel.h"
#import "YPHomeTableViewCell.h"

@interface YPHomeProxy ()

@property (nonatomic, weak) YPHomeViewModel *viewModel;

@end

@implementation YPHomeProxy

- (instancetype)initWithViewModel:(YPHomeViewModel *)viewModel {
    if (self = [self init]) {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YPHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YPHomeTableViewCell"];
    YPFormElement *cellModel = self.viewModel.dataList[indexPath.row];
    cell.cellModel = cellModel;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 44.f;
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[YPShakeManager shareInstance] tapShare];
    
    YPFormElement *cellModel = self.viewModel.dataList[indexPath.row];
    Class vcClass = NSClassFromString(cellModel.extend);
    YPBaseViewController *vc = [[vcClass alloc] init];
    if ([vc isKindOfClass:[YPBaseViewController class]]) {
        vc.hidesBottomBarWhenPushed = YES;
        [[UIViewController yp_topViewController].navigationController pushViewController:vc animated:YES];
    }
}

@end
