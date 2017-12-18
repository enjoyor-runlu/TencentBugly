//
//  BuglyManager.h
//  ArtEnjoymentRunLu
//
//  Created by jiaguoshang on 2017/11/16.
//  Copyright © 2017年 YiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuglyManager : NSObject

//创建实例,配置bugly
+ (void)managerWithAppId:(NSString *)appId;

//设置用户标识,可将当前登录用户名设置进来,在退出登录的时候置空
+ (void)setUserIdentifier:(NSString *)userId;

//上报异常,在可能会发生crash的地方try--catch
+ (void)reportException:(NSException *)exception;

//上报错误,重要的接口监控,了解接口状态,或者其他错误
+ (void)reportError:(NSError *)error;

@end
