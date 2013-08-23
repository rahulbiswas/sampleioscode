#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
  UIWindow *window;
  ViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) ViewController *viewController;

@end