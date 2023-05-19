//
//  YPAboutUsProxy.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class YPAboutUsViewModel;

@interface YPAboutUsProxy : NSObject <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithViewModel:(YPAboutUsViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
