//
//  YPUIComponentViewModel.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/19.
//

#import "YPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YPUIComponentViewModelDelegate <NSObject>

- (void)didEndLoadData:(BOOL)hasMore;

@end

@interface YPUIComponentViewModel : NSObject

@property (nonatomic, weak) id <YPUIComponentViewModelDelegate> delegate;
@property (nonatomic, readonly) NSMutableArray *dataList;

- (void)startLoadData;

- (void)loadMoreData;

@end

NS_ASSUME_NONNULL_END
