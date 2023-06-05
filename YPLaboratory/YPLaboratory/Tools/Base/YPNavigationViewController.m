//
//  YPNavigationViewController.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/17.
//

#import "YPNavigationViewController.h"

@interface YPNavigationViewController () <UIGestureRecognizerDelegate>

@end

@implementation YPNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
      在大标题模式下，导航栏的外观会根据滚动行为自动进行调整，以提供更好的可读性和一致性。当用户向上滚动时，导航栏可能会变为半透明或黑色，以确保标题与背景内容有足够的对比度。
      要禁用导航栏的大标题特性，并确保导航栏保持您设置的颜色，您可以在 UINavigationBarAppearance 中进行设置。以下是一个示例代码片段，演示了如何禁用大标题特性并保持导航栏的白色背景：
     */
    
    // 获取当前导航栏外观对象
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = self.navigationBar.standardAppearance;
        [appearance configureWithDefaultBackground];
        appearance.backgroundColor = nil;
        // 应用新的外观设置
        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = appearance;
    } else {
        // Fallback on earlier versions
        self.navigationBar.barTintColor = nil;
    }
    
    self.navigationBar.titleTextAttributes = @{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:18.f],
        NSForegroundColorAttributeName: [UIColor yp_blackColor],
    };
    
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
}

#pragma mark - UIGestureRecognizerDelegate
//当手势开始滑动作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    [[YPShakeManager shareInstance] tapShare];
    //子控制器个数只剩下一个(这一个就是根控制器),手势不可用
    NSArray *vcs = self.childViewControllers;
    if (vcs.count > 1) {
        YPBaseViewController *vc = vcs.lastObject;
        if ([vc isKindOfClass:[YPBaseViewController class]]) {
            return [vc allowSideslip];
        } else {
            return YES;
        }
    }
    BOOL open = vcs.count != 1;
    return open;
}

@end
