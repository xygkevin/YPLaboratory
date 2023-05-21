//
//  UIViewController+Router.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/21.
//

#import "UIViewController+Router.h"
#import <UIKit/UIKit.h>
#import "YPModuleTableViewController.h"

@implementation UIViewController (Router)

- (void)pushToControllerWithRouter:(YPPageRouter *)pageRouter {
    YPPageRouter *cellModel = pageRouter;
    switch (cellModel.type) {
        case YPPageRouterTypeNormal:
            
            break;
        case YPPageRouterTypeCopy:
            // Copy model->content
            break;
        case YPPageRouterTypeTable:
        case YPPageRouterTypeCollection: {
            // 是一个列表  table | collection
            YPModuleTableViewController *vc = [[YPModuleTableViewController alloc] init];
            vc.model = pageRouter;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case YPPageRouterTypePush: {
            // 需要Push新的页面 extend=类试图的字符串
            Class vcClass = NSClassFromString(cellModel.extend);
            YPBaseViewController *vc = [[vcClass alloc] init];
            if ([vc isKindOfClass:[YPBaseViewController class]]) {
                vc.hidesBottomBarWhenPushed = YES;
                [[UIViewController yp_topViewController].navigationController pushViewController:vc animated:YES];
            }
        }
            break;
        case YPPageRouterTypeAppCheckUpdate: {
            // app检查更新
            [[YPSettingManager sharedInstance] showAppstore];
        }
            break;
        case YPPageRouterTypeAppComment: {
            // app评论
            [[YPSettingManager sharedInstance] showComment];
        }
            break;
        case YPPageRouterTypeAppInternalPurchase: {
            // 应用内购 extend=productId
            
        }
            break;
        case YPPageRouterTypeTableCell: {
            // 子视图，需要指定展示cell（table）
        }
            break;
        case YPPageRouterTypeCollectionCell: {
            // 子视图，需要指定展示cell（collection）
        }
            break;
            
        default:
            break;
    }
}

@end
