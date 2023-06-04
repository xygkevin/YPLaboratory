//
//  YPRouterManager.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/20.
//

#import "YPRouterManager.h"
#import "YPPageRouterModuleCategoryHeader.h"

@interface YPRouterManager ()

@end

@implementation YPRouterManager

+ (instancetype)shareInstance {
    static YPRouterManager *m = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = [[YPRouterManager alloc] init];
    });
    return m;
}

- (NSArray *)allRouter {
    return @[];
}

- (YPPageRouter *)homeRouter {
    YPPageRouter *homeRouter = [[YPPageRouter alloc] init];
    homeRouter.title = @"ls_home_tabbar".yp_localizedString;
    homeRouter.type = YPPageRouterTypeTable;
    return homeRouter;
}

- (NSArray <YPPageRouterModule *>*)getRoutersByModel:(YPPageRouter *)model {
    NSArray *dataList = @[];
    if ([model.title isEqualToString:@"ls_home_tabbar".yp_localizedString]) {
        dataList = [YPPageRouterModule HomeRouters];
    } else if ([model.title isEqualToString:@"ls_ui_component".yp_localizedString]) {
        dataList = [YPPageRouterModule ComponentRouters];
    } else if ([model.title isEqualToString:@"ls_apple_internal_purchase".yp_localizedString]) {
        dataList = [YPPageRouterModule AppleInternalPurchase];
    } else if ([model.title isEqualToString:@"丰富多彩的 cell（UITableView）".yp_localizedString]) {
        dataList = [YPPageRouterModule ComponentRouters_TableCells];
    } else if ([model.title isEqualToString:@"多样的选择框（UIPickerView）".yp_localizedString]) {
        dataList = [YPPageRouterModule ComponentRouters_PickerView];
    } else if ([model.title isEqualToString:@"导航栏控制（UINavigationBar）".yp_localizedString]) {
        dataList = [YPPageRouterModule ComponentRouters_NavigationBar];
    }
    return [dataList copy];
}

@end
