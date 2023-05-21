//
//  YPModuleTableTableViewCell.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/21.
//

#import "YPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class YPPageRouter;

@interface YPModuleTableTableViewCell : UITableViewCell

@property (nonatomic, strong) YPPageRouter *cellModel;

@end

NS_ASSUME_NONNULL_END
