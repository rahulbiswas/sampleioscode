#import "ViewController.h"

@implementation ViewController

- (void) button0Pressed {
    NSLog(@"button0Pressed");
}

- (void) button1Pressed {
    NSLog(@"button1Pressed");
}

- (void)loadView {
	[super loadView];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 40)];
    label.text = @"Professor Pepper";
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor yellowColor];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
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