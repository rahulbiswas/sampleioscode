#import "ViewController.h"

@implementation ViewController

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

- (void)loadView {
	[super loadView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 40)];
    _label.text = @"Professor Pepper";
    _label.font = [UIFont systemFontOfSize:20];
    _label.textColor = [UIColor yellowColor];
    _label.backgroundColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
    _dancingR = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 50, 50)];
    _dancingR.text = @"R";
    _dancingR.backgroundColor = [UIColor clearColor];
    _dancingR.textColor = [UIColor redColor];
    [self.view addSubview:_dancingR];
    
    UIButton* button0 = [[UIButton alloc] initWithFrame:CGRectMake(20, 70, 80, 40)];
    [button0 setTitle:@"Off" forState:UIControlStateNormal];
    button0.backgroundColor = [UIColor orangeColor];
    button0.titleLabel.font = [UIFont systemFontOfSize:20];
    [button0 addTarget:self action:@selector(button0Pressed) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button0];
    
    UIButton* button1 = [[UIButton alloc] initWithFrame:CGRectMake(220, 70, 80, 40)];
    [button1 setTitle:@"On" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor orangeColor];
    button1.titleLabel.font = [UIFont systemFontOfSize:20];
    [button1 addTarget:self action:@selector(button1Pressed) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}

@end