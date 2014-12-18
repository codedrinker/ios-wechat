//
//  ViewController.h
//  wechat
//
//  Created by twer  on 12/16/14.
//  Copyright (c) 2014 twer . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinWeChatController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
- (IBAction)joinAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *avatorField;
- (IBAction)SignUp:(id)sender;

@end

