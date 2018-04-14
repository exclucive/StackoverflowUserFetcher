//
//  ViewController.m
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "SOFViewController.h"
#import "SOFUserTableViewCell.h"
#import "SOFUserFetcher.h"
#import "SOFUser.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <UIActivityIndicator-for-SDWebImage/UIImageView+UIActivityIndicatorForSDWebImage.h>

@interface SOFViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

//
@property (strong, nonatomic) NSArray *users;

@end

@implementation SOFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchUsers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Helpers

- (void)fetchUsers {
    self.tableView.hidden = YES;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"Loading users...";
    
    __weak typeof(self) weakSelf = self;
    [SOFUserFetcher fetchUsersWithCompletion:^(NSError * _Nullable error, NSArray * _Nullable users) {        
        if (!error) {
            weakSelf.users = users;
            [weakSelf.tableView reloadData];
        } else {
            // handle error
            [weakSelf showErrorWithMessage:error.localizedDescription];
        }
        self.tableView.hidden = NO;
        [hud hideAnimated:YES];
    }];
}

- (void)showErrorWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"StackOverflow" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (void)configureUserCell:(SOFUserTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    SOFUser *user = self.users[indexPath.row];
    [cell.profileImageView setImageWithURL:user.profileImageURL usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    cell.userNameLabel.text = user.name;
    cell.goldBadgeLabel.text = [NSString stringWithFormat:@"Gold: %d", user.goldCount];
    cell.silverBadgeLabel.text = [NSString stringWithFormat:@"Silver: %d", user.silverCount];
    cell.bronzeBadgeLabel.text = [NSString stringWithFormat:@"Bronze: %d", user.bronzeCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SOFUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSOFUserTableViewCellIdentifier forIndexPath:indexPath];
    [self configureUserCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
