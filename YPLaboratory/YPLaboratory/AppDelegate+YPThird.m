//
//  AppDelegate+YPThird.m
//  YPChildStudy
//
//  Created by Hansen on 2023/1/1.
//

#import "AppDelegate+YPThird.h"
#import "JPUSHService.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
#import <AdSupport/AdSupport.h>
#import <Bugly/Bugly.h>
#import "YPPurchaseManager.h"
#import "YPHTTPVerifyPaymentRequest.h"

@interface AppDelegate () <JPUSHRegisterDelegate, BuglyDelegate>

@end

@implementation AppDelegate (YPThird)

#pragma mark - database

- (void)setupDatabase {
//    if ([YPPromptsManager shareInstance].isNeedInitializeDatabase) {
//        [YPLoadingView showLoading];
//        [[YPPromptsManager shareInstance] initializeDatabaseCallback:^(BOOL success) {
//            [YPLoadingView hideLoading];
//        }];
//    } else {
//        if ([YPPromptsManager shareInstance].autoUpdate) {
//            // 更新咒语
//            [[YPPromptsManager shareInstance] updatePromptsSDK:NO callback:nil];
//        }
//    }
}

#pragma mark - Bugly

- (void)buglyInitConfigure {
    NSString *kBuglyAppId = @"214e0f65cb";
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.unexpectedTerminatingDetectionEnable = NO; //非正常退出事件记录开关，默认关闭
    config.reportLogLevel = BuglyLogLevelWarn; //报告级别
    config.deviceIdentifier = [UIDevice currentDevice].identifierForVendor.UUIDString; //设备标识
    config.blockMonitorEnable = YES; //开启卡顿监控
    config.blockMonitorTimeout = 10; //卡顿监控判断间隔，单位为秒
    config.delegate = self;
#if DEBUG
    config.debugMode = NO; //SDK Debug信息开关, 默认关闭
    config.channel = @"debug";
#else
    config.channel = @"release";
#endif
    [Bugly startWithAppId:kBuglyAppId
#if DEBUG
        developmentDevice:YES
#endif
                   config:config];
}

//此方法返回的数据，可在bugly平台中异常上报，具体异常信息的跟踪数据附件信息中的crash_attach.log中查看
- (NSString *)attachmentForException:(NSException *)exception {
    return [NSString stringWithFormat:@"🚀🚀🚀 exceptionInfo:\nname:%@\nreason:%@ 🚀🚀🚀",exception.name, exception.reason];
}


#pragma mark - JPUSH

- (void)registerUserNotification {
    [self APNS_init];
}

//添加初始化JPush代码
- (void)jpushInitDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self registerUserNotification];
    //极光推送
    NSString *kJPushAppKey = @"dc785ae7b68240122ff0db9c";
    NSString *kChannel = @"1000";
    NSInteger apsForProduction = 1;
# ifdef DEBUG
    apsForProduction = 0;
# endif
    [JPUSHService setLogOFF];
    [JPUSHService setupWithOption:launchOptions appKey:kJPushAppKey channel:kChannel apsForProduction:apsForProduction];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler API_AVAILABLE(ios(10.0)) {
    // app处在前台收到推送消息执行的方法
    completionHandler(UNNotificationPresentationOptionNone);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler  API_AVAILABLE(ios(10.0)) {
    // ios 10以后系统，app处在后台，点击通知栏 app执行的方法
    completionHandler();
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // 远程通知注册失败委托
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // 收到通知
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)APNS_init {
    //添加初始化APNs代码
    // Required
    // notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity *entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert | JPAuthorizationOptionBadge | JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = JPAuthorizationOptionAlert | JPAuthorizationOptionBadge | JPAuthorizationOptionSound;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
        UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        [JPUSHService registerForRemoteNotificationTypes:types categories:nil];
#pragma clang diagnostic pop
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger options))completionHandler {
    // 远程通知注册成功委托
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    } else {
        //to do
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kYPNSNotificationCenterClickPush object:nil];
    completionHandler();//系统要求执行这个方法
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification NS_AVAILABLE_IOS(12.0) {
    
}

#pragma mark - notification

- (void)addObserverNotification {
    // 收到需要检查内购丢包情况
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(needCheckInternalPurchasePayment:) name:kYPPurchaseNeedCheckInternalPurchasePayment object:nil];
}

#pragma mark - check pay

- (void)checkInternalPurchasePayment {
    __weak typeof(self) weakSelf = self;
    [[YPPurchaseManager sharedInstance] checkInternalPurchasePayment:^(NSString *checkPath, NSDictionary *payDic, NSError *error) {
        if (payDic.count > 0) {
            [weakSelf requestSendAppStoreBuyReceipt:payDic];
        }
    }];
}

- (void)needCheckInternalPurchasePayment:(NSNotification *)sender {
    __weak typeof(self) weakSelf = self;
    [[YPPurchaseManager sharedInstance] checkInternalPurchasePayment:^(NSString *checkPath, NSDictionary *payDic, NSError *error) {
        if (payDic.count > 0) {
            [weakSelf requestSendAppStoreBuyReceipt:payDic];
        }
    }];
}

- (void)requestSendAppStoreBuyReceipt:(NSDictionary *)payDic {
    YPHTTPVerifyPaymentRequest *request = [[YPHTTPVerifyPaymentRequest alloc] init];
    request.receiptData = payDic[@"receiptData"];
    [request startWithSuccessHandler:^(YPHTTPResponse * _Nonnull response) {
        if ([response.responseData[@"status"] intValue] == 0) {
            // 检验成功，用户已经支付了
            [[YPPurchaseManager sharedInstance] deleteByPaymentVoucher:payDic];
            
            [YPAlertView alertText:@"谢谢您的慷慨。\n祝您工作顺利，生活愉快！" duration:4.f];
            // 获取商品名称
            NSString *productName = payDic[@"productName"]?:@"";
            // 订单号
            NSString *orderId = [NSString stringWithFormat:@"%@",payDic[@"transactionId"]?:@""];
            // 获取商品价格
            NSInteger amount = [NSString stringWithFormat:@"%@",payDic[@"price"]].floatValue * 100;// 金额 分
            // 上报支付成功
            [[YPTrackingManager sharedInstance] uploadEvent:YPTrackingEventTypePaymentComplete event:@{
                @"orderId":orderId,
                @"productName":productName,
                @"amount":@(amount),
            }];
        }
    } failureHandler:^(NSError * _Nonnull error) {
        //
    }];
}

@end
