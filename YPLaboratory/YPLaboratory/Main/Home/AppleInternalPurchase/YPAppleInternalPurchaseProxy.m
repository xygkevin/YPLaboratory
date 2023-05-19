//
//  YPAppleInternalPurchaseProxy.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPAppleInternalPurchaseProxy.h"
#import "YPAppleInternalPurchaseViewModel.h"
#import "YPAppleInternalPurchaseTableViewCell.h"
#import "YPAppleInternalPurchaseModel.h"

@interface YPAppleInternalPurchaseProxy ()

@property (nonatomic, weak) YPAppleInternalPurchaseViewModel *viewModel;

@end

@implementation YPAppleInternalPurchaseProxy

- (instancetype)initWithViewModel:(YPAppleInternalPurchaseViewModel *)viewModel {
    if (self = [self init]) {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YPAppleInternalPurchaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YPAppleInternalPurchaseTableViewCell"];
    YPAppleInternalPurchaseModel *cellModel = self.viewModel.dataList[indexPath.row];
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
