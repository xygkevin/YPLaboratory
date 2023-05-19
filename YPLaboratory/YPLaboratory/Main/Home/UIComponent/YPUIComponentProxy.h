//
//  YPUIComponentProxy.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class YPUIComponentViewModel;

@interface YPUIComponentProxy : NSObject <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithViewModel:(YPUIComponentViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
