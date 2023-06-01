//
//  YPPageRouter.h
//  YPLaboratory
//
//  Created by Hansen on 2023/5/20.
//

#import <YPUIKit/YPUIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    YPPageRouterTypeNormal = 0,
    YPPageRouterTypeCopy, // Copy model->content
    YPPageRouterTypeTable, // 是一个列表 table
    YPPageRouterTypeCollection, // 是一个列表 collection
    YPPageRouterTypePush, // 需要Push新的页面 extend=类试图的字符串
    YPPageRouterTypeAppCheckUpdate, // app检查更新
    YPPageRouterTypeAppComment, // app评论
    YPPageRouterTypeAppInternalPurchase, // 应用内购 extend=productId
    YPPageRouterTypeTableCell, // 子视图，需要指定展示cell（table）
    YPPageRouterTypeCollectionCell, // 子视图，需要指定展示cell（collection）
} YPPageRouterType;

@interface YPPageRouter : NSObject

@property (nonatomic, assign) BOOL enable;// default YES
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) id extend;
@property (nonatomic, assign) YPPageRouterType type;
@property (nonatomic, assign) BOOL useInsetGrouped;// 是否使用 InsetGrouped default NO

@end

NS_ASSUME_NONNULL_END
