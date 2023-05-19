//
//  YPUIComponentTableViewCell.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class YPUIComponentModel;

@interface YPUIComponentTableViewCell : UITableViewCell

@property (nonatomic, strong) YPUIComponentModel *cellModel;

@end

NS_ASSUME_NONNULL_END
