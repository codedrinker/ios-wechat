//
//  MeViewController.m
//  wechat
//
//  Created by twer  on 12/17/14.
//  Copyright (c) 2014 twer . All rights reserved.
//

#import "MeViewController.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>

@interface MeViewController ()
@property(weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property(weak, nonatomic) IBOutlet UILabel *userNameField;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *user = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"];
    self.userNameField.text = [user objectForKey:@"name"];
    [self.avatorImageView sd_setImageWithURL:/*[user objectForKey:@"avator_url"]*/@"https://avatars2.githubusercontent.com/u/2978524?v=3&s=460"];

    self.avatorImageView.layer.borderWidth = 1;
    self.avatorImageView.layer.borderColor = [UIColor redColor].CGColor;
    self.avatorImageView.layer.cornerRadius = self.avatorImageView.frame.size.width / 2;
    self.avatorImageView.clipsToBounds = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
