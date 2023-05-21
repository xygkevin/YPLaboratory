//
//  YPRouterManager.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/20.
//

#import "YPRouterManager.h"

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

- (NSArray <YPPageRouter *>*)getRoutersByModel:(YPPageRouter *)model {
    NSArray *dataList = @[];
    if ([model.title isEqualToString:@"ls_home_tabbar".yp_localizedString]) {
        dataList = [self homeRouters];
    } else if ([model.title isEqualToString:@"ls_ui_component".yp_localizedString]) {
        dataList = [self componentRouters];
    } else if ([model.title isEqualToString:@"ls_apple_internal_purchase".yp_localizedString]) {
        dataList = [self appleInternalPurchase];
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
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_check_update".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"ls_about_us".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    return dataList;
}

// 苹果内购相关
- (NSArray *)appleInternalPurchase {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"不请我喝冰可乐".yp_localizedString;
        element.type = YPPageRouterTypeAppInternalPurchase;
        element.extend = @"free_goods";
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"请我喝 1 杯冰可乐".yp_localizedString;
        element.type = YPPageRouterTypeAppInternalPurchase;
        element.extend = @"6_goods";
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"请我喝 2 杯冰可乐".yp_localizedString;
        element.type = YPPageRouterTypeAppInternalPurchase;
        element.extend = @"12_goods";
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"请我喝 3 杯冰可乐".yp_localizedString;
        element.type = YPPageRouterTypeAppInternalPurchase;
        element.extend = @"18_goods";
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"请我喝 4.16 杯冰可乐".yp_localizedString;
        element.type = YPPageRouterTypeAppInternalPurchase;
        element.extend = @"25_goods";
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"请我喝 16.5 杯冰可乐".yp_localizedString;
        element.type = YPPageRouterTypeAppInternalPurchase;
        element.extend = @"99_goods";
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"免费的支持".yp_localizedString;
        element.type = YPPageRouterTypeAppComment;
        [dataList addObject:element];
    }
    
    return dataList;
}

// UI 组件
- (NSArray *)componentRouters {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"丰富多彩的 cell（UITableView）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"丰富多彩的 cell（UICollectionViewFlowLayout）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"多样的选择框（UIPickerView）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"导航栏控制（UINavigationBar）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"好用的按钮（YPButton）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"普通提示框（YPAlertView）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"自定义弹框（YPPopupController）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"好用的多行输入框（YPTextView）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"轮播图（YPSwiperView）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"多种功能的摄像机".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"iOS 视频播放".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"TableView嵌入播放器（仿线程卡顿处理）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"模拟新浪@人".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"模拟微信朋友圈".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"角标和红点".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"模拟支付宝输入密码".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"应用与网站之间通讯（js 交互）".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"一些常见下拉弹框".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"跑马灯效果".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    return dataList;
}

@end
