//
//  BuglyManager.m
//  ArtEnjoymentRunLu
//
//  Created by jiaguoshang on 2017/11/16.
//  Copyright © 2017年 YiXiang. All rights reserved.
//

#import "BuglyManager.h"
#import <Bugly/BuglyConfig.h>
#import <Bugly/Bugly.h>
#import <Bugly/BuglyLog.h>

#if DEBUG
#define BuglyCHANNEL                     @"Dev"
#else
#define BuglyCHANNEL                     @"AppStore"
#endif

@implementation BuglyManager

//创建实例,配置bugly
+ (void)managerWithAppId:(NSString *)appId
{
    if (!appId || [appId isEqualToString:@""] || [appId isKindOfClass:[NSNull class]]) {
        NSCAssert(NO, @"请配置正确的appId");
        return;
    }
    BuglyConfig *config = [[BuglyConfig alloc] init];
    
#if DEBUG
    config.debugMode = YES;
#else
#endif
    config.channel = BuglyCHANNEL;
    config.unexpectedTerminatingDetectionEnable = YES;
    config.blockMonitorEnable = YES;
    config.reportLogLevel = BuglyLogLevelWarn;
    
    [Bugly startWithAppId:appId
#if DEBUG
        developmentDevice:YES
#endif
                   config:config
     ];
    
}

+ (void)setUserIdentifier:(NSString *)userId
{
    [Bugly setUserIdentifier:userId];
}

+ (void)reportException:(NSException *)exception
{
    [Bugly reportException:exception];
}

+ (void)reportError:(NSError *)error
{
    [Bugly reportError:error];
}

@end
