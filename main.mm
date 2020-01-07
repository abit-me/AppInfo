#import "AppInfo.h"
#define COLOR_RESET     "\e[m"
#define COLOR_GREEN     "\e[0;32m"
#define COLOR_YELLOW    "\e[0;33m"
#define COLOR_CYAN      "\e[0;36m"
#define COLOR_BLUE      "\e[0;34m"

int main(int argc, char **argv, char **envp) {
	
	NSArray *installedApp = [AppInfo installedAppsInfos];
	printf("已安装的App: %lu\n", (unsigned long)[installedApp count]);
	for (NSDictionary *app in installedApp)
	{
		printf("----------------------------------------------------------------------------------------------------\n");
        printf(COLOR_BLUE);
        printf("AppName:        ");
        printf(COLOR_RESET);
		printf("%s\n", [[app valueForKey:@"appName"] UTF8String]);
        printf(COLOR_YELLOW);
        printf("BundleID:       ");
        printf(COLOR_RESET);
		printf("%s\n", [[app valueForKey:@"bundleID"] UTF8String]);
        printf(COLOR_GREEN);
        printf("HomePath:       ");
        printf(COLOR_RESET);
        printf("%s\n", [[app valueForKey:@"dataPath"] UTF8String]);
        printf(COLOR_CYAN);
        printf("BundlePath:     ");
        printf(COLOR_RESET);
		printf("%s\n", [[app valueForKey:@"bundlePath"] UTF8String]);
	}
    printf("----------------------------------------------------------------------------------------------------\n");
	return 0;
}

// vim:ft=objc
