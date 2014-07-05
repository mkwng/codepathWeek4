//
//  LoginViewController.m
//  codepathWeek4
//
//  Created by Michael Wang on 7/5/14.
//  Copyright (c) 2014 mkwng. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
- (IBAction)tapGestureRecognizer:(UITapGestureRecognizer *)sender;

@end

@implementation LoginViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapGestureRecognizer:(UITapGestureRecognizer *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
