//
//  AppInfo.m
//  iRctl
//
//  Created by A on 2017/9/11.
//  Copyright © 2017年 A. All rights reserved.
//

#import "AppInfo.h"
#import <spawn.h>
#import "Useful.h"

@implementation AppInfo

+ (NSArray *)installedAppsProxy {

    LSApplicationWorkspace *workspace = [NSClassFromString(@"LSApplicationWorkspace") defaultWorkspace];
    NSArray *proxies = [workspace applicationsOfType:0]; // LSApplicationProxy
    return proxies;
}

+ (NSArray *)installedApps {
    
    NSMutableArray *arr = [NSMutableArray new];
    for (LSApplicationProxy *proxy in [self installedAppsProxy])
    {
        NSDictionary *dic = @{@"name" : [proxy localizedName], @"bundle_id" : [proxy applicationIdentifier]};
        [arr addObject:dic];
    }
    return arr;
}

+ (NSArray *)installedAppsInfos {

    NSMutableArray *arr = [NSMutableArray new];
    for (LSApplicationProxy *proxy in [self installedAppsProxy])
    {
        NSDictionary *dic = @{@"bundleID" : [proxy applicationIdentifier], @"appName" : [proxy localizedName],
                              @"bundlePath" : [proxy bundleContainerURL].path, @"dataPath" : [proxy dataContainerURL].path};
        [arr addObject:dic];
    }
    return arr;
}

@end
