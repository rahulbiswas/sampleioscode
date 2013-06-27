#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.viewController = [[ViewController alloc] init];
  [window addSubview:viewController.view];
  [window makeKeyAndVisible];
  
  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(sayHello) userInfo:nil repeats:YES];
  
	return YES;
}

- (void) sayHello
{
  NSLog(@"hello");
}

@end