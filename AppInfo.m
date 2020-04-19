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

+ (NSArray *)installedAppsInfos {
    
    NSMutableArray *arr = [NSMutableArray new];
    NSArray *appsProxy = [self installedAppsProxy];
    for (LSApplicationProxy *proxy in appsProxy) {
        
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setValue:[proxy applicationIdentifier] forKey:@"app_bundle_id"];
        [dict setValue:[proxy localizedName] forKey:@"app_name"];
        [dict setValue:[[proxy bundleContainerURL] path] forKey:@"app_bundle_path"];
        [dict setValue:[[proxy dataContainerURL] path] forKey:@"app_data_path"];
        [dict setValue:[proxy bundleExecutable] forKey:@"app_bundle_executable"];
        [arr addObject:dict];
    }
    [arr sortUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
        NSString *appName1 = [obj1 valueForKey:@"app_name"];
        NSString *appName2 = [obj2 valueForKey:@"app_name"];
        return [appName1 compare:appName2];
    }];
    return arr;
}

@end
