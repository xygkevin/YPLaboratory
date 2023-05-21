//
//  YPTrackingManager.h
//  YPPrompts
//
//  Created by Hansen on 2023/4/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    YPTrackingEventTypeUnknown = 0,
    YPTrackingEventTypeCopy,/// 点击复制
    YPTrackingEventTypeDelete,/// 点击删除
    YPTrackingEventTypeEdit,/// 点击编辑
    YPTrackingEventTypeAdd,/// 点击新增
    YPTrackingEventTypeCollection,/// 点击收藏
    YPTrackingEventTypeSearch,/// 搜索内容
    YPTrackingEventTypeSave,/// 保存内容
    YPTrackingEventTypeSafari,/// 跳转Safari
    YPTrackingEventTypeComment,/// 点击评论
    YPTrackingEventTypePayment,/// 点击支付
    YPTrackingEventTypePaymentComplete,/// 支付完成
    YPTrackingEventTypeCheckUpdate,/// app 检查更新
    YPTrackingEventTypePromptsCheckUpdate,/// proments 检查更新
} YPTrackingEventType;

@interface YPTrackingManager : NSObject

@property (nonatomic, readonly) NSString *udid;// 设备唯一标识

+ (instancetype)sharedInstance;

- (void)initTrackSDK;

/// 上传事件埋点
/// - Parameters:
///   - type: 类型
///   - event: 事件
- (void)uploadEvent:(YPTrackingEventType)type event:(NSDictionary *)event;

@end

NS_ASSUME_NONNULL_END
