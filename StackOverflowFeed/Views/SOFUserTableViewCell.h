//
//  SOFUserTableViewCell.h
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const _Nonnull kSOFUserTableViewCellIdentifier; 

@interface SOFUserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goldBadgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *silverBadgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bronzeBadgeLabel;

@end
