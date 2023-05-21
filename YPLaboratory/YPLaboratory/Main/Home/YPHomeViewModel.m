//
//  YPHomeViewModel.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/17.
//

#import "YPHomeViewModel.h"

@interface YPHomeViewModel ()

@property (nonatomic, strong) NSMutableArray *dataList;

@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation YPHomeViewModel

- (instancetype)init {
    if (self = [super init]) {
        self.pageSize = 10;
        self.pageIndex = 1;
        self.dataList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)startLoadData {
    self.pageIndex = 1;
    [self startLoadingData:_pageIndex];
}

- (void)loadMoreData {
    self.pageIndex ++;
    [self startLoadingData:_pageIndex];
}

- (void)startLoadingData:(NSInteger)pageIndex {
    BOOL hasMore = NO;
    
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_ui_component".yp_localizedString;
        element.extend = @"YPUIComponentViewController";
        [self.dataList addObject:element];
    }
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_apple_internal_purchase".yp_localizedString;
        element.extend = @"YPAppleInternalPurchaseViewController";
        [self.dataList addObject:element];
    }
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_app_icon_build".yp_localizedString;
        element.extend = @"YPBaseViewController";
        [self.dataList addObject:element];
    }
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_network".yp_localizedString;
        element.extend = @"YPBaseViewController";
        [self.dataList addObject:element];
    }
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_database".yp_localizedString;
        element.extend = @"YPBaseViewController";
        [self.dataList addObject:element];
    }
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_file_management".yp_localizedString;
        element.extend = @"YPBaseViewController";
        [self.dataList addObject:element];
    }
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_idea_box".yp_localizedString;
        element.extend = @"YPBaseViewController";
        [self.dataList addObject:element];
    }
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_check_update".yp_localizedString;
        element.extend = @"YPBaseViewController";
        [self.dataList addObject:element];
    }
    {
        YPFormElement *element = [[YPFormElement alloc] init];
        element.title = @"ls_about_us".yp_localizedString;
        element.extend = @"YPAboutUsViewController";
        [self.dataList addObject:element];
    }
    
    if ([self.delegate respondsToSelector:@selector(didEndLoadData:)]) {
        [self.delegate didEndLoadData:hasMore];
    }
}

@end
