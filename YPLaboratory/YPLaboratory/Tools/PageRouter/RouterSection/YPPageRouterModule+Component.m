//
//  YPPageRouterModule+Component.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/25.
//

#import "YPPageRouterModule+Component.h"
#import "YPPageRouterModule+Update.h"

@implementation YPPageRouterModule (Component)

// UI 组件
+ (NSArray *)ComponentRouters {
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
    YPPageRouterModule *section = [[YPPageRouterModule alloc] initWithRouters:dataList];
    return @[section];
}

// 丰富多彩的cell
+ (NSArray *)ComponentRouters_TableCells {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"丰富多彩的 cell（UITableView）".yp_localizedString;
        element.type = YPPageRouterTypeTableCell;
        [dataList addObject:element];
    }
    YPPageRouterModule *section = [[YPPageRouterModule alloc] initWithRouters:dataList];
    return @[section];
}

// 丰富多彩的cell
+ (NSArray *)ComponentRouters_CollectionCells {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"丰富多彩的 cell（UITableView）".yp_localizedString;
        element.type = YPPageRouterTypeTableCell;
        [dataList addObject:element];
    }
    YPPageRouterModule *section = [[YPPageRouterModule alloc] initWithRouters:dataList];
    return @[section];
}

// 多样的选择框
+ (NSArray *)ComponentRouters_PickerView {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"时分".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        NSString *format = @"HH:mm";
        element.content = format;
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSDate *date = [NSDate yp_DateWithString:router.content dateFormat:format];
            YPDatePickerAlert *alert = [YPDatePickerAlert popupWithDate:date?:[NSDate date] completeBlock:^(NSDate * _Nonnull date) {
                router.content = [date yp_StringWithDateFormat:format];
                [self yp_reloadCurrentCell:cell];
            }];
            alert.datePickerMode = UIDatePickerModeTime;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"年月日".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        NSString *format = @"yyyy-MM-dd";
        element.content = format;
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSDate *date = [NSDate yp_DateWithString:router.content dateFormat:format];
            YPDatePickerAlert *alert = [YPDatePickerAlert popupWithDate:date?:[NSDate date] completeBlock:^(NSDate * _Nonnull date) {
                router.content = [date yp_StringWithDateFormat:format];
                [self yp_reloadCurrentCell:cell];
            }];
            alert.datePickerMode = UIDatePickerModeDate;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"年月日分".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        NSString *format = @"yyyy-MM-dd HH:mm";
        element.content = format;
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSDate *date = [NSDate yp_DateWithString:router.content dateFormat:format];
            YPDatePickerAlert *alert = [YPDatePickerAlert popupWithDate:date?:[NSDate date] completeBlock:^(NSDate * _Nonnull date) {
                router.content = [date yp_StringWithDateFormat:format];
                [self yp_reloadCurrentCell:cell];
            }];
            alert.datePickerMode = UIDatePickerModeDateAndTime;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"倒计时".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        NSString *format = @"HH:mm";
        element.content = format;
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSDate *date = [NSDate yp_DateWithString:router.content dateFormat:format];
            YPDatePickerAlert *alert = [YPDatePickerAlert popupWithDate:date?:[NSDate date] completeBlock:^(NSDate * _Nonnull date) {
                router.content = [date yp_StringWithDateFormat:format];
                [self yp_reloadCurrentCell:cell];
            }];
            alert.datePickerMode = UIDatePickerModeCountDownTimer;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"字体选择".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = @"Font";
        NSArray *fonts = [UIFont familyNames];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [fonts indexOfObject:router.content];
            YPPickerAlert *alert = [YPPickerAlert popupWithOptions:fonts completeBlock:^(NSInteger index) {
                router.content = fonts[index];
                [self yp_reloadCurrentCell:cell];
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"颜色选择".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = @"Color";
        NSArray *colors = [UIColor yp_allColors];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [colors indexOfObject:router.content];
            YPColorPickerAlert *alert = [YPColorPickerAlert popupWithOptions:colors completeBlock:^(NSInteger index) {
                router.content = colors[index];
                [self yp_reloadCurrentCell:cell];
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"性别选择".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = @"Gender";
        NSArray *fonts = @[@"男",@"女",@"沃尔玛购物袋"];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [fonts indexOfObject:router.content];
            YPPickerAlert *alert = [YPPickerAlert popupWithOptions:fonts completeBlock:^(NSInteger index) {
                router.content = fonts[index];
                [self yp_reloadCurrentCell:cell];
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"地址选择（省市区）".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = @"Address";
        [dataList addObject:element];
    }
    YPPageRouterModule *section = [[YPPageRouterModule alloc] initWithRouters:dataList];
    return @[section];
}

// 导航栏控制
+ (NSArray *)ComponentRouters_NavigationBar {
    NSMutableArray *dataList = [[NSMutableArray alloc] init];
    UINavigationBar *navigationBar = [UIViewController yp_topViewController].navigationController.navigationBar;
    
    BOOL enableScrollEdgeAppearance = NO;
    if (@available(iOS 13.0, *)) {
        enableScrollEdgeAppearance = navigationBar.scrollEdgeAppearance ? NO : YES;
    } else {
        enableScrollEdgeAppearance = NO;
    }
    
    BOOL translucent = navigationBar.translucent;
    UIColor *tintColor = navigationBar.tintColor;
    UIColor *barTintColor = navigationBar.barTintColor;
    if (@available(iOS 13.0, *)) {
        barTintColor = navigationBar.standardAppearance.backgroundColor;
    }
//    UIImage *shadowImage = navigationBar.shadowImage;
    NSDictionary *titleTextAttributes = navigationBar.titleTextAttributes;
    UIFont *titleFont = titleTextAttributes[NSFontAttributeName];
    NSString *titleFontName = titleFont.fontName;
    UIColor *titleColor = titleTextAttributes[NSForegroundColorAttributeName];
    BOOL isBold = YES;
    {
        if (@available(iOS 13.0, *)) {
            YPPageRouter *element = [[YPPageRouter alloc] init];
            element.title = @"导航滚动边缘变化（iOS 13）".yp_localizedString;
            element.type = YPPageRouterTypeSwitch;
            element.content = @(enableScrollEdgeAppearance).stringValue;
            element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
                BOOL enableScrollEdgeAppearance = router.content.boolValue;
                if (enableScrollEdgeAppearance) {
                    navigationBar.scrollEdgeAppearance = nil;
                } else {
                    navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance;
                }
            };
            [dataList addObject:element];
        }
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"导航是否半透明".yp_localizedString;
        element.type = YPPageRouterTypeSwitch;
        element.content = @(translucent).stringValue;
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            BOOL translucent = router.content.boolValue;
            navigationBar.translucent = translucent;
        };
        [dataList addObject:element];
    }
//    {
//        YPPageRouter *element = [[YPPageRouter alloc] init];
//        element.title = @"导航是否全透明".yp_localizedString;
//        element.type = YPPageRouterTypeSwitch;
//        element.content = @"0";
//        [dataList addObject:element];
//    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"导航主题色调".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = [UIColor yp_hexStringFromColor:tintColor];
        NSArray *colors = [UIColor yp_allColors];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [colors indexOfObject:router.content];
            YPColorPickerAlert *alert = [YPColorPickerAlert popupWithOptions:colors completeBlock:^(NSInteger index) {
                router.content = colors[index];
                [self yp_reloadCurrentCell:cell];
                navigationBar.tintColor = [UIColor yp_colorWithHexString:router.content];
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"导航背景颜色".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = [UIColor yp_hexStringFromColor:barTintColor];
        NSArray *colors = [UIColor yp_allColors];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [colors indexOfObject:router.content];
            YPColorPickerAlert *alert = [YPColorPickerAlert popupWithOptions:colors completeBlock:^(NSInteger index) {
                router.content = colors[index];
                [self yp_reloadCurrentCell:cell];
                navigationBar.barTintColor = [UIColor yp_colorWithHexString:router.content];
                if (@available(iOS 13.0, *)) {
                    navigationBar.standardAppearance.backgroundColor = navigationBar.barTintColor;
                }
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
//    {
//        YPPageRouter *element = [[YPPageRouter alloc] init];
//        element.title = @"导航是否显示底部线条".yp_localizedString;
//        element.type = YPPageRouterTypeSwitch;
//        element.content = @"0";
//        [dataList addObject:element];
//    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"导航字体".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = titleFontName;
        NSArray *fonts = [UIFont familyNames];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [fonts indexOfObject:router.content];
            YPPickerAlert *alert = [YPPickerAlert popupWithOptions:fonts completeBlock:^(NSInteger index) {
                router.content = fonts[index];
                [self yp_reloadCurrentCell:cell];
                NSMutableDictionary *titleTextAttributes = [navigationBar.titleTextAttributes mutableCopy];
                UIFont *font = titleTextAttributes[NSFontAttributeName];
                titleTextAttributes[NSFontAttributeName] = [UIFont fontWithName:router.content size:font.pointSize];
                [navigationBar setTitleTextAttributes:titleTextAttributes];
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"导航字体颜色".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = [UIColor yp_hexStringFromColor:titleColor];
        NSArray *colors = [UIColor yp_allColors];
        element.didSelectedCallback = ^(YPPageRouter * _Nonnull router, UIView *cell) {
            NSUInteger currentIndex = [colors indexOfObject:router.content];
            YPColorPickerAlert *alert = [YPColorPickerAlert popupWithOptions:colors completeBlock:^(NSInteger index) {
                router.content = colors[index];
                [self yp_reloadCurrentCell:cell];
                NSMutableDictionary *titleTextAttributes = [navigationBar.titleTextAttributes mutableCopy];
                titleTextAttributes[NSForegroundColorAttributeName] = [UIColor yp_colorWithHexString:router.content];
                [navigationBar setTitleTextAttributes:titleTextAttributes];
            }];
            alert.currentIndex = currentIndex;
            [[UIViewController yp_topViewController] presentViewController:alert animated:YES completion:nil];
        };
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"导航字体大小".yp_localizedString;
        element.type = YPPageRouterTypeNormal;
        element.content = @(titleFont.pointSize).stringValue;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"导航字体是否加粗".yp_localizedString;
        element.type = YPPageRouterTypeSwitch;
        element.content = @(isBold).stringValue;
        [dataList addObject:element];
    }
    {
        YPPageRouter *element = [[YPPageRouter alloc] init];
        element.title = @"重置所有".yp_localizedString;
        element.type = YPPageRouterTypeButton;
        [dataList addObject:element];
    }
    YPPageRouterModule *section = [[YPPageRouterModule alloc] initWithRouters:dataList];
    return @[section];
}

@end
