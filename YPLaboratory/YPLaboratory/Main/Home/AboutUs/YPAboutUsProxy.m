//
//  YPAboutUsProxy.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPAboutUsProxy.h"
#import "YPAboutUsViewModel.h"
#import "YPAboutUsTableViewCell.h"
#import "YPAboutUsModel.h"

@interface YPAboutUsProxy ()

@property (nonatomic, weak) YPAboutUsViewModel *viewModel;

@end

@implementation YPAboutUsProxy

- (instancetype)initWithViewModel:(YPAboutUsViewModel *)viewModel {
    if (self = [self init]) {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YPAboutUsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YPAboutUsTableViewCell"];
    YPAboutUsModel *cellModel = self.viewModel.dataList[indexPath.row];
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
