//
//  YPUIComponentProxy.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPUIComponentProxy.h"
#import "YPUIComponentViewModel.h"
#import "YPUIComponentTableViewCell.h"
#import "YPUIComponentModel.h"

@interface YPUIComponentProxy ()

@property (nonatomic, weak) YPUIComponentViewModel *viewModel;

@end

@implementation YPUIComponentProxy

- (instancetype)initWithViewModel:(YPUIComponentViewModel *)viewModel {
    if (self = [self init]) {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YPUIComponentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YPUIComponentTableViewCell"];
    YPUIComponentModel *cellModel = self.viewModel.dataList[indexPath.row];
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
}

@end
