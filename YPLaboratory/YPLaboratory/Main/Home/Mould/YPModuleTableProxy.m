//
//  YPModuleTableProxy.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/21.
//

#import "YPModuleTableProxy.h"
#import "YPModuleTableViewModel.h"
#import "YPModuleTableTableViewCell.h"
#import "YPPageRouter.h"
#import "UIViewController+Router.h"
#import "UIViewController+Router.h"

@interface YPModuleTableProxy ()

@property (nonatomic, weak) YPModuleTableViewModel *viewModel;

@end

@implementation YPModuleTableProxy

- (instancetype)initWithViewModel:(YPModuleTableViewModel *)viewModel {
    if (self = [self init]) {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YPModuleTableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YPModuleTableTableViewCell"];
    YPPageRouter *cellModel = self.viewModel.dataList[indexPath.row];
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
    YPPageRouter *cellModel = self.viewModel.dataList[indexPath.row];
    [[UIViewController yp_topViewController] pushToControllerWithRouter:cellModel];
}

@end
