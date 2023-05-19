//
//  YPHomeProxy.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/17.
//

#import "YPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class YPHomeViewModel;

@interface YPHomeProxy : NSObject <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithViewModel:(YPHomeViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
