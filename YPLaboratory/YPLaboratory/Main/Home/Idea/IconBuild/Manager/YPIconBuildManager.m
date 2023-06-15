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
    });
    return m;
}

@end
