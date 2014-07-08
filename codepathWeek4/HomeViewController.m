//
//  HomeViewController.m
//  codepathWeek4
//
//  Created by Michael Wang on 7/5/14.
//  Copyright (c) 2014 mkwng. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()
- (IBAction)onLogin:(id)sender;
- (IBAction)onCancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UIView *loginView;
@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.loginView.alpha=0;
    self.loginView.center = CGPointMake(self.loginView.center.x, 852);
    [self.loginButton addTarget:self action:@selector(onCancelButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogin:(id)sender {
    self.loginView.center = CGPointMake(self.loginView.center.x, 284);
    
    [UIView animateWithDuration:.2 animations:^{
        self.loginView.alpha = 1;
    } completion:^(BOOL finished) {
        [self.emailTextField becomeFirstResponder];
    }];

}

- (IBAction)onCancelButton:(id)sender {
    
    [UIView animateWithDuration:.2 animations:^{
        self.loginView.alpha = 0;
    } completion:^(BOOL finished) {
        self.loginView.center = CGPointMake(self.loginView.center.x, 852);
        [self.view endEditing:YES];
    }];

}
@end
