//
//  ChatViewController.m
//  wechat
//
//  Created by twer  on 12/18/14.
//  Copyright (c) 2014 twer . All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "ChatViewController.h"
#import <Firebase/Firebase.h>

typedef NSDictionary *dictionary;

@interface ChatViewController ()

@property(nonatomic, strong) NSMutableArray *messages;

@end

@implementation ChatViewController {
    NSDictionary *currentUser;
    Firebase *firebase;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idMessageCell" forIndexPath:indexPath];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idMessageCell"];
    }
    NSDictionary *msg = [self.messages objectAtIndex:indexPath.row];

    NSString *sender = [msg objectForKey:@"sender"];

    cell.textLabel.text = sender;
    cell.detailTextLabel.text = [msg objectForKey:@"text"];
    [cell.imageView sd_setImageWithURL:[msg objectForKey:@"avator_url"] placeholderImage:[UIImage imageNamed:@"default_avatar.png"]];

    if ([sender isEqualToString:[currentUser objectForKey:@"name"]]) {
        cell.textLabel.textColor = [UIColor grayColor];
    } else {
        cell.textLabel.textColor = [UIColor greenColor];
    }

    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    currentUser = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"];
    self.navigationItem.title = [self.chatWith objectForKey:@"name"];
    self.messages = [NSMutableArray arrayWithCapacity:12];
    firebase = [[Firebase alloc] initWithUrl:@"https://saochats.firebaseio.com/"];

    [firebase observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        [self.messages addObject:snapshot.value];
        [self.chatTableView reloadData];


    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendBtn:(id)sender {
    NSString *text = self.text.text;
    NSLog(@"Text is %@", text);
    self.text.text = @"";

    dictionary message = @{
            @"userId" : [currentUser objectForKey:@"id"],
            @"sender" : [currentUser objectForKey:@"name"],
            @"avator_url" : [currentUser objectForKey:@"avator_url"],
            @"to" : [_chatWith objectForKey:@"name"],
            @"text" : text
    };
    dictionary fakeMessage = @{
            @"userId" : @"101",
            @"sender" : @"wangchunlei",
            @"avator_url" : @"http://avatars3.githubusercontent.com/u/3821949?v=3&s=460",
            @"to" : @"LVJIAN",
            @"text" : @"Hello Kitty"
    };


    NSLog(@"%@", fakeMessage);
    [firebase setValue:message];
    [firebase setValue:fakeMessage];
}
@end
