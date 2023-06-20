//
//  YPIconBuildManager.m
//  YPLaboratory
//
//  Created by Hansen on 2023/6/15.
//

#import "YPIconBuildManager.h"

@implementation YPIconBuildManager

+ (instancetype)shareInstance {
    static YPIconBuildManager *m = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = [[YPIconBuildManager alloc] init];
        m.iconPath = @"请选择图标文件：最佳1024 * 1024像素";
        m.betaString = @"BETA";
        m.betaColor = [UIColor whiteColor];
        m.betaBackgroundColor = [UIColor redColor];
        m.isAddBeta = NO;
    });
    return m;
}

- (UIImage *)iconImage {
    UIImage *image = nil;
    if([[NSFileManager defaultManager] fileExistsAtPath:self.iconPath]){
        image = [[UIImage alloc] initWithContentsOfFile:self.iconPath];
    }
    
    if (!self.isAddBeta) {
        return image;
    }
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 1024.f, 1024.f);
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = image;
    
    UIView *baseView = [[UIView alloc] init];
    baseView.backgroundColor = self.betaBackgroundColor;
    CGRect f1 = CGRectMake(0, 0, 1024, 1024.f / 5.f);
    f1.origin.y = f1.size.width - f1.size.height;
    baseView.frame = f1;
    [imageView addSubview:baseView];
    
    UILabel *baseLabel = [[UILabel alloc] init];
    baseLabel.text = self.betaString;
    baseLabel.textColor = self.betaColor;
    baseLabel.font = [UIFont systemFontOfSize:160.f];
    baseLabel.textAlignment = NSTextAlignmentCenter;
    baseLabel.frame = baseView.bounds;
    [baseView addSubview:baseLabel];
    UIImage *iconImage = [imageView yp_screenshotsImage];
    return iconImage;
}

@end
