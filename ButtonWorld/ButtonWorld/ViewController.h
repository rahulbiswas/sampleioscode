#import <UIKit/UIKit.h>

typedef enum {TWOBUTTON, BUTTONWORLD} Mode;

@interface ViewController : UIViewController {
  Mode mode;
}

@property (nonatomic, retain) UILabel* label;
@property (nonatomic, retain) UILabel* dancingR;

@property Mode mode;

- (BOOL) isIOS5;
- (BOOL) isIOS6;
- (BOOL) isIOS7;

@end