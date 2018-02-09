#import <UIKit/UIKit.h>

@interface CAWindowServer : NSObject
+ (id)context;
+ (id)contextWithOptions:(id)arg1;
+ (id)server;
+ (id)serverIfRunning;
- (void)_detectDisplays;
- (id)_init;
- (void)addDisplay:(id)arg1;
- (unsigned int)clientPortOfContextId:(unsigned int)arg1;
- (unsigned int)contextIdHostingContextId:(unsigned int)arg1;
- (void)dealloc;
- (id)description;
- (id)displayWithDisplayId:(unsigned int)arg1;
- (id)displayWithName:(id)arg1;
- (id)displayWithUniqueId:(id)arg1;
- (id)displays;
- (id)init;
- (id)insecureProcessIds;
- (BOOL)isMirroringEnabled;
- (BOOL)isSecure;
- (void)removeAllDisplays;
- (void)removeDisplay:(id)arg1;
- (unsigned int)rendererFlags;
- (id)secureModeViolations;
- (void)setMirroringEnabled:(BOOL)arg1;
- (void)setRendererFlags:(unsigned int)arg1;
- (void)setSecure:(BOOL)arg1;
- (unsigned int)taskPortOfContextId:(unsigned int)arg1;
@end

@interface CAWindowServerDisplay : NSObject

- (id)deviceName;
- (unsigned int)displayId;
- (id)name;
- (id)orientation;
- (int)processId;
- (float)scale;
- (CGRect)bounds;
@end

@interface FBBundleInfo : NSObject
@property (nonatomic, copy) NSString *bundleIdentifier;
@property (nonatomic, copy) NSString *bundleType;
@property (nonatomic, retain) NSURL *bundleURL;
@property (nonatomic, copy) NSString *bundleVersion;
@property (nonatomic, retain) NSUUID *cacheGUID;
@property (nonatomic, copy) NSString *displayName;
@property (nonatomic, copy) NSDictionary *extendedInfo;
@property (nonatomic) unsigned int sequenceNumber;
@end

@interface FBApplicationInfo: FBBundleInfo

@property (nonatomic, readonly, retain) NSURL *bundleContainerURL;
@property (nonatomic, readonly, retain) NSArray *customMachServices;
@property (nonatomic, readonly, retain) NSURL *dataContainerURL;
@end

@interface LSResourceProxy : NSObject

@end

@interface LSBundleProxy : LSResourceProxy
@property (nonatomic, readonly) NSString *localizedShortName;
@end


@interface LSApplicationProxy : LSBundleProxy
@property (nonatomic, readonly) NSString *applicationType;
@property (nonatomic, readonly) NSString *applicationIdentifier;
@property(readonly) NSURL * dataContainerURL;
@property(readonly) NSURL * bundleContainerURL;
@property(readonly) NSString * localizedShortName;
@property(readonly) NSString * localizedName;
@end

@interface LSApplicationWorkspace : NSObject

+ (id)defaultWorkspace;
- (BOOL)installApplication:(NSURL *)path withOptions:(NSDictionary *)options;
- (BOOL)uninstallApplication:(NSString *)identifier withOptions:(NSDictionary *)options;
- (id)allApplications;
- (id)allInstalledApplications;
- (BOOL)applicationIsInstalled:(id)arg1;
- (id)applicationsOfType:(unsigned int)arg1;
@end

@interface UIScreen ()
-(CGRect)_applicationFrameForInterfaceOrientation:(int)interfaceOrientation;
+(CGAffineTransform)transformForScreenOriginRotation:(float)screenOriginRotation;
+(CGAffineTransform)transformToRotateScreen:(float)rotateScreen;
-(id)initWithDisplay:(id)display;
// -(void)observeValueForKeyPath:(id)keyPath ofObject:(id)object change:(id)change context:(void*)context;
-(void)_setupBounds;
-(CGRect)_realDisplayBounds;
//-(float)scale;
-(void)setScale:(float)scale;
-(float)_rotation;
-(int)bitsPerComponent;
-(void)setBitsPerComponent:(int)component;
-(int)screenType;
-(id)_name;
-(BOOL)_isMainScreen;
-(BOOL)_hasStatusBar;
@end
