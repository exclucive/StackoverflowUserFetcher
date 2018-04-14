//
//  SOFUser.m
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "SOFUser.h"

NSString *const kSOFUserProfileImageURLField = @"profile_image";
NSString *const kSOFUserNameField = @"display_name";
NSString *const kSOFUserBadgesCountField = @"badge_counts";
NSString *const kSOFUserBadgesGold = @"gold";
NSString *const kSOFUserBadgesSilver = @"silver";
NSString *const kSOFUserBadgesBronze = @"bronze";

@interface SOFUser ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSURL *profileImageURL;
@property (nonatomic, assign, readwrite) int goldCount;
@property (nonatomic, assign, readwrite) int silverCount;
@property (nonatomic, assign, readwrite) int bronzeCount;

@end

@implementation SOFUser

- (instancetype)initWithJSON:(NSDictionary *)userJSON
{
    self = [super init];
    if (self) {
        _name = userJSON[kSOFUserNameField];
        _profileImageURL = userJSON[kSOFUserProfileImageURLField];
        _goldCount = (int)userJSON[kSOFUserBadgesCountField][kSOFUserBadgesGold];
        _silverCount = (int)userJSON[kSOFUserBadgesCountField][kSOFUserBadgesSilver];
        _bronzeCount = (int)userJSON[kSOFUserBadgesCountField][kSOFUserBadgesBronze];
    }
    
    return self;
}

@end
