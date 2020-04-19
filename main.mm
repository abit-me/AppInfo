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
        printf("name:           ");
        printf(COLOR_RESET);
		printf("%s\n", [[app valueForKey:@"app_name"] UTF8String]);
        printf(COLOR_YELLOW);
        printf("executable:     ");
        printf(COLOR_RESET);
        printf("%s\n", [[app valueForKey:@"app_bundle_executable"] UTF8String]);
        printf("bundle_id:      ");
        printf(COLOR_RESET);
		printf("%s\n", [[app valueForKey:@"app_bundle_id"] UTF8String]);
        printf(COLOR_GREEN);
        printf("home_path:      ");
        printf(COLOR_RESET);
        printf("%s\n", [[app valueForKey:@"app_data_path"] UTF8String]);
        printf(COLOR_CYAN);
        printf("bundle_path:    ");
        printf(COLOR_RESET);
		printf("%s\n", [[app valueForKey:@"app_bundle_path"] UTF8String]);
	}
    printf("----------------------------------------------------------------------------------------------------\n");
	return 0;
}

// vim:ft=objc
