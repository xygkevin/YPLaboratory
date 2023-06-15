//
//  YPIconBuildManager.h
//  YPLaboratory
//
//  Created by Hansen on 2023/6/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YPIconBuildManager : NSObject

@property (nonatomic, strong) NSString *iconPath;
@property (nonatomic, strong) NSString *betaString;// default beta
@property (nonatomic, strong) UIColor *betaColor;// default white
@property (nonatomic, strong) UIColor *betaBackgroundColor;// default red

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
