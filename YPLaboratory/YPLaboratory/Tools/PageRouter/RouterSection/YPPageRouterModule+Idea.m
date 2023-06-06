//
//  YPPageRouterModule+Idea.m
//  YPLaboratory
//
//  Created by Hansen on 2023/6/6.
//

#import "YPPageRouterModule+Idea.h"

@implementation YPPageRouterModule (Idea)

// 程序之美
+ (NSArray *)IdeaRouters {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_app_icon_build".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    YPPageRouterModule *section = [[YPPageRouterModule alloc] initWithRouters:dataList];
    return @[section];
}

@end
