//
//  TabViewController.m
//  codepathWeek4
//
//  Created by Michael Wang on 7/5/14.
//  Copyright (c) 2014 mkwng. All rights reserved.
//

#import "TabViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "AccountViewController.h"
#import "ActivityViewController.h"

@interface TabViewController ()

@property (weak, nonatomic) IBOutlet UIView *composeView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
@property (weak, nonatomic) IBOutlet UIButton *activityButton;

- (IBAction)onHomeButton:(id)sender;
- (IBAction)onSearchButton:(id)sender;
- (IBAction)onAccountButton:(id)sender;
- (IBAction)onActivityButton:(id)sender;
- (IBAction)onComposeButton:(id)sender;

@property (strong, nonatomic) HomeViewController *homeVc;
@property (strong, nonatomic) SearchViewController *searchVc;
@property (strong, nonatomic) AccountViewController *accountVc;
@property (strong, nonatomic) ActivityViewController *activityVc;

@property (weak, nonatomic) IBOutlet UIImageView *exploreImageView;
- (void)bounceExplore;

@end

@implementation TabViewController



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

    self.composeView.center = CGPointMake(self.composeView.center.x, self.composeView.center.y+568);
    self.composeView.alpha = 0;
    
    self.homeVc = [[HomeViewController alloc] init];
    
    self.searchVc = [[SearchViewController alloc] init];
    self.accountVc = [[AccountViewController alloc] init];
    self.activityVc = [[ActivityViewController alloc] init];
    
    self.homeVc.view.frame = CGRectMake(0, 0, 320, 524);
    self.searchVc.view.frame = CGRectMake(0, 0, 320, 1217);
    self.accountVc.view.frame = CGRectMake(0, 0, 320, 524);
    self.activityVc.view.frame = CGRectMake(0, 0, 320, 524);
    
    [self onHomeButton:nil];
    [self bounceExplore];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeButton:(id)sender {
    self.contentView.contentSize = self.homeVc.view.frame.size;
    [self.contentView addSubview:self.homeVc.view];
    
    if (self.exploreImageView.alpha<1) {
        [UIView animateWithDuration:.2 animations:^{
            self.exploreImageView.alpha = 1;
        }];
        [self bounceExplore];
    }

    self.homeButton.selected = YES;
    self.searchButton.selected = NO;
    self.accountButton.selected = NO;
    self.activityButton.selected = NO;
}

- (IBAction)onSearchButton:(id)sender {
    self.contentView.contentSize = self.searchVc.view.frame.size;
    [self.contentView addSubview:self.searchVc.view];
    
    [UIView animateWithDuration:.2 animations:^{
        self.exploreImageView.alpha = 0;
    }];


    self.homeButton.selected = NO;
    self.searchButton.selected = YES;
    self.accountButton.selected = NO;
    self.activityButton.selected = NO;

}

- (IBAction)onAccountButton:(id)sender {
    self.contentView.contentSize = self.accountVc.view.frame.size;
    [self.contentView addSubview:self.accountVc.view];
    
    if (self.exploreImageView.alpha<1) {
        [UIView animateWithDuration:.2 animations:^{
            self.exploreImageView.alpha = 1;
        }];
        [self bounceExplore];
    }

    self.homeButton.selected = NO;
    self.searchButton.selected = NO;
    self.accountButton.selected = YES;
    self.activityButton.selected = NO;

}

- (IBAction)onActivityButton:(id)sender {
    self.contentView.contentSize = self.activityVc.view.frame.size;
    [self.contentView addSubview:self.activityVc.view];
    
    if (self.exploreImageView.alpha<1) {
        [UIView animateWithDuration:.2 animations:^{
            self.exploreImageView.alpha = 1;
        }];
        [self bounceExplore];
    }

    self.homeButton.selected = NO;
    self.searchButton.selected = NO;
    self.accountButton.selected = NO;
    self.activityButton.selected = YES;

}

- (IBAction)onComposeButton:(id)sender {
}

- (void)bounceExplore {
    CGPoint origin = self.exploreImageView.center;
    CGPoint target = CGPointMake(self.exploreImageView.center.x, self.exploreImageView.center.y-20);
    CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce.duration = 0.2;
    bounce.fromValue = [NSNumber numberWithInt:origin.y];
    bounce.toValue = [NSNumber numberWithInt:target.y];
    bounce.repeatCount = 2;
    bounce.autoreverses = YES;
    [self.exploreImageView.layer addAnimation:bounce forKey:@"position"];
}

@end
