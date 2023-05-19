//
//  YPAppleInternalPurchaseProxy.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class YPAppleInternalPurchaseViewModel;

@interface YPAppleInternalPurchaseProxy : NSObject <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithViewModel:(YPAppleInternalPurchaseViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
