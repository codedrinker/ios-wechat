//
//  ChatViewController.h
//  wechat
//
//  Created by twer  on 12/18/14.
//  Copyright (c) 2014 twer . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(weak, nonatomic) IBOutlet UITableView *chatTableView;

@property(nonatomic, strong) NSDictionary *chatWith;
@property(weak, nonatomic) IBOutlet UITextField *text;

- (IBAction)sendBtn:(id)sender;

@end
