//
//  ViewController.m
//  wechat
//
//  Created by twer  on 12/16/14.
//  Copyright (c) 2014 twer . All rights reserved.
//

#import "JoinWeChatController.h"
#import "AFHTTPRequestOperationManager.h"
#import "MainViewController.h"

@interface JoinWeChatController ()

@end

@implementation JoinWeChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)joinAction:(id)sender {
    NSString *name = self.nameField.text;
    NSString *avator = self.avatorField.text;
    NSLog(@"your name is %@", name);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"user[name]" : name,
            @"user[avator_url]" : avator};
    [manager POST:@"http://192.168.43.69:3000/users.json"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"JSON: %@", responseObject);

              [[NSUserDefaults standardUserDefaults] setObject:responseObject forKey:@"currentUser"];
              [[NSUserDefaults standardUserDefaults] synchronize];
              MainViewController *mainController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainViewController"];
              [self presentViewController:mainController animated:YES completion:nil];
              //跳转以后不能返回跳转以前的页面
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }];
}

- (IBAction)SignUp:(id)sender {
    NSString *name = self.nameField.text;
    NSLog(name);
}
@end
