//
//  YPPageRouterModule+Idea.m
//  YPLaboratory
//
//  Created by Hansen on 2023/6/6.
//

#import "YPPageRouterModule+Idea.h"
#import "YPIconBuildManager.h"
#import "YPIconBuildTableViewCell.h"
#import "YPPageRouterModule+Update.h"

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
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"防 截屏|录屏 功能".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"贪吃蛇小游戏".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"井字游戏".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"数独游戏".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"模拟 mdos 攻击".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"获取 WIFI 列表".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"获取当前 WIFI 联网设备".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"获取蓝牙设备列表".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"Socket 的消息互传".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"App 公祭日置灰模式".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"手持弹幕".yp_localizedString;
        element.type = YPPageRouterTypeTable;
        [dataList addObject:element];
    }
    YPPageRouterModule *section = [[YPPageRouterModule alloc] initWithRouters:dataList];
    return @[section];
}

+ (NSArray *)IdeaRouters_IconBuild {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = [YPIconBuildManager shareInstance].iconPath?:@"";
        element.type = YPPageRouterTypeTableCell;
        element.cellHeight = 100.f;
        element.extend = [YPIconBuildTableViewCell class];
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"Beta 文字".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = [YPIconBuildManager shareInstance].betaString?:@"";
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"Beta 文字颜色".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = [UIColor yp_hexStringFromColor:[YPIconBuildManager shareInstance].betaColor];
        NSArray *colors = [UIColor yp_allColors];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [colors indexOfObject:router.content];
            YPColorPickerAlert *alert = [YPColorPickerAlert popupWithOptions:colors completeBlock:^(NSInteger index) {
                router.content = colors[index];
                [YPIconBuildManager shareInstance].betaColor = [UIColor yp_colorWithHexString:router.content];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self yp_reloadCurrentModuleControl];
                });
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"Beta 背景颜色".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = [UIColor yp_hexStringFromColor:[YPIconBuildManager shareInstance].betaBackgroundColor];
        NSArray *colors = [UIColor yp_allColors];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [colors indexOfObject:router.content];
            YPColorPickerAlert *alert = [YPColorPickerAlert popupWithOptions:colors completeBlock:^(NSInteger index) {
                router.content = colors[index];
                [YPIconBuildManager shareInstance].betaBackgroundColor = [UIColor yp_colorWithHexString:router.content];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self yp_reloadCurrentModuleControl];
                });
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"添加BETA".yp_localizedString;
        element.type = YPPageRouterTypeButton;
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView * _Nonnull cell) {
            [YPIconBuildManager shareInstance].isAddBeta = YES;
            [self yp_reloadCurrentModuleControl];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"移除BETA".yp_localizedString;
        element.type = YPPageRouterTypeButton;
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView * _Nonnull cell) {
            [YPIconBuildManager shareInstance].isAddBeta = NO;
            [self yp_reloadCurrentModuleControl];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"制作 App 图标".yp_localizedString;
        element.type = YPPageRouterTypeButton;
        [dataList addObject:element];
    }
    YPPageRouterModule *section = [[YPPageRouterModule alloc] initWithRouters:dataList];
    return @[section];
}

@end
