#import "ViewController.h"

@implementation ViewController

@synthesize mode;

- (BOOL) isIOS5 {
  NSString *version = [[UIDevice currentDevice] systemVersion];
  return [version hasPrefix:@"5."];
}

- (BOOL) isIOS6 {
  NSString *version = [[UIDevice currentDevice] systemVersion];
  return [version hasPrefix:@"6."];
}

- (BOOL) isIOS7 {
  NSString *version = [[UIDevice currentDevice] systemVersion];
  return [version hasPrefix:@"7."];
}

- (int) allElementYOffset {
  if ([self isIOS5] || [self isIOS6]) return 0;
  return [UIApplication sharedApplication].statusBarFrame.size.height;
}

- (void) clearContents {
  for (UIView* view in self.view.subviews) {
    [view removeFromSuperview];
  }
}

- (void) button0Pressed {
  NSLog(@"button0Pressed");
  [UIView animateWithDuration:1.0 animations:^{
    _label.alpha = 0.0;
  }];
  [UIView animateWithDuration:0.5 animations:^{
    _dancingR.frame = CGRectMake(20, 120, 50, 50);
  }];
}

- (void) button1Pressed {
  NSLog(@"button1Pressed");
  [UIView animateWithDuration:1.0 animations:^{
    _label.alpha = 1.0;
  }];
  [UIView animateWithDuration:0.5 animations:^{
    _dancingR.frame = CGRectMake(300, 120, 50, 50);
  }];
}

- (void) buttonWorldMode {
  mode = BUTTONWORLD;
  [self clearContents];
  [self loadView];
}

- (void) twoButtonMode {
  mode = TWOBUTTON;
  [self clearContents];
  [self loadView];
}

- (void)loadView {
	[super loadView];
  
  switch (mode) {
    case BUTTONWORLD:
      [self loadView_buttonWorld];
      break;
    case TWOBUTTON:
      [self loadView_twoButton];
      break;
  }
}

- (UIButton*) makeButton:(UIButtonType)buttonType x:(int)x y:(int)y w:(int)w h:(int)h text:(NSString*)text color:(UIColor*)color
{
  UIButton* button = [UIButton buttonWithType:buttonType];
  button.frame = CGRectMake(x, y + [self allElementYOffset], w, h);
  [button setTitle:text forState:UIControlStateNormal];
  button.backgroundColor = color;
  button.titleLabel.font = [UIFont systemFontOfSize:20];
  return button;
}

- (void) loadView_buttonWorld {
  UIButton* button0 = [self makeButton:UIButtonTypeSystem x:10 y:10 w:300 h:40 text:@"Back to Two Button" color:[UIColor redColor]];
  [button0 addTarget:self action:@selector(twoButtonMode) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:button0];

  UIButton* button1 = [self makeButton:UIButtonTypeContactAdd x:10 y:60 w:300 h:40 text:@"UIButtonTypeContactAdd" color:[UIColor orangeColor]];
  [self.view addSubview:button1];

  UIButton* button2 = [self makeButton:UIButtonTypeCustom x:10 y:110 w:300 h:40 text:@"UIButtonTypeCustom" color:[UIColor yellowColor]];
  button2.titleLabel.textColor = [UIColor brownColor];
  [self.view addSubview:button2];
  
  UIButton* button3 = [self makeButton:UIButtonTypeDetailDisclosure x:10 y:160 w:300 h:40 text:@"UIButtonTypeDetailDisclosure" color:[UIColor greenColor]];
  [self.view addSubview:button3];
  
  UIButton* button4 = [self makeButton:UIButtonTypeInfoDark x:10 y:210 w:300 h:40 text:@"UIButtonTypeInfoDark" color:[UIColor blueColor]];
  [self.view addSubview:button4];

  UIButton* button5 = [self makeButton:UIButtonTypeInfoLight x:10 y:260 w:300 h:40 text:@"UIButtonTypeInfoLight" color:[UIColor purpleColor]];
  [self.view addSubview:button5];
  
  UIButton* button6 = [self makeButton:UIButtonTypeRoundedRect x:10 y:310 w:300 h:40 text:@"UIButtonTypeRoundedRect" color:[UIColor blackColor]];
  [self.view addSubview:button6];

  UIButton* button7 = [self makeButton:UIButtonTypeSystem x:10 y:360 w:300 h:40 text:@"UIButtonTypeSystem" color:[UIColor cyanColor]];
  [self.view addSubview:button7];
}

- (void) loadView_twoButton {
  _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10 + [self allElementYOffset], 300, 40)];
  _label.text = @"Some Text";
  _label.font = [UIFont systemFontOfSize:20];
  _label.textColor = [UIColor yellowColor];
  _label.backgroundColor = [UIColor blackColor];
  _label.textAlignment = NSTextAlignmentCenter;
  [self.view addSubview:_label];
  
  _dancingR = [[UILabel alloc] initWithFrame:CGRectMake(20, 120 + [self allElementYOffset], 50, 50)];
  _dancingR.text = @"R";
  _dancingR.backgroundColor = [UIColor clearColor];
  _dancingR.textColor = [UIColor redColor];
  [self.view addSubview:_dancingR];
  
  UIButton* button0 = [[UIButton alloc] initWithFrame:CGRectMake(20, 70 + [self allElementYOffset], 80, 40)];
  [button0 setTitle:@"Off" forState:UIControlStateNormal];
  button0.backgroundColor = [UIColor orangeColor];
  button0.titleLabel.font = [UIFont systemFontOfSize:20];
  [button0 addTarget:self action:@selector(button0Pressed) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:button0];
 
  UIButton* button1 = [[UIButton alloc] initWithFrame:CGRectMake(220, 70 + [self allElementYOffset], 80, 40)];
  [button1 setTitle:@"On" forState:UIControlStateNormal];
  button1.backgroundColor = [UIColor orangeColor];
  button1.titleLabel.font = [UIFont systemFontOfSize:20];
  [button1 addTarget:self action:@selector(button1Pressed) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:button1];
  
  UIButton* buttonWorld = [[UIButton alloc] initWithFrame:CGRectMake(20, 170 + [self allElementYOffset], 0, 0)];
  [buttonWorld setTitle:@"Button World" forState:UIControlStateNormal];
  buttonWorld.backgroundColor = [UIColor redColor];
  buttonWorld.titleLabel.font = [UIFont systemFontOfSize:20];
  [buttonWorld sizeToFit];
  buttonWorld.frame =
    CGRectMake(buttonWorld.frame.origin.x, buttonWorld.frame.origin.y,
               buttonWorld.frame.size.width + 20, buttonWorld.frame.size.height + 20);
  [buttonWorld addTarget:self action:@selector(buttonWorldMode) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:buttonWorld];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}

@end