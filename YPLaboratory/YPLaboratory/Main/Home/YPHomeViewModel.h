//
//  YPHomeViewModel.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/17.
//

#import "YPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YPHomeViewModelDelegate <NSObject>

- (void)didEndLoadData:(BOOL)hasMore;

@end

@interface YPHomeViewModel : NSObject

@property (nonatomic, weak) id <YPHomeViewModelDelegate> delegate;
@property (nonatomic, readonly) NSMutableArray *dataList;

- (void)startLoadData;

- (void)loadMoreData;

@end

NS_ASSUME_NONNULL_END
