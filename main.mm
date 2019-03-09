#import "AppInfo.h"

int main(int argc, char **argv, char **envp) {
	
	NSArray *installedApp = [AppInfo installedAppsInfos];
	printf("已安装的App: %lu\n", (unsigned long)[installedApp count]);
	for (NSDictionary *app in installedApp)
	{
		printf("\n");
		printf("appName:    %s\n", [[app valueForKey:@"appName"] UTF8String]);
		printf("bundleID:   %s\n", [[app valueForKey:@"bundleID"] UTF8String]);
		printf("bundlePath: %s\n", [[app valueForKey:@"bundlePath"] UTF8String]);
		printf("dataPath:   %s\n", [[app valueForKey:@"dataPath"] UTF8String]);
	}
	return 0;
}

// vim:ft=objc
