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
        dataList = [self homeRouters];
    } else if ([model.title isEqualToString:@"ls_ui_component".yp_localizedString]) {
        dataList = [YPPageRouterModule ComponentRouters];
    } else if ([model.title isEqualToString:@"ls_apple_internal_purchase".yp_localizedString]) {
        dataList = [YPPageRouterModule AppleInternalPurchase];
    } else if ([model.title isEqualToString:@"丰富多彩的 cell（UITableView）".yp_localizedString]) {
        dataList = [YPPageRouterModule ComponentRouters_TableCells];
    }
    return [dataList copy];
}

#pragma mark - dataList

- (NSArray *)homeRouters {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_idea_box".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_ui_component".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_apple_internal_purchase".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_app_icon_build".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_network".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_database".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"调试日志".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"代码生成工具".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_file_management".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    YPPageRouterModule *section1 = [[YPPageRouterModule alloc] initWithRouters:dataList];
    
    NSMutableArray *dataList2 = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_check_update".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList2 addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_about_us".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList2 addObject:element];
    }
    YPPageRouterModule *section2 = [[YPPageRouterModule alloc] initWithRouters:dataList2];
    
    return @[section1, section2];
}

@end
