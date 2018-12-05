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
NSString *const kSOFReputationField = @"reputation";
NSString *const kSOFUserBadgesCountField = @"badge_counts";
NSString *const kSOFUserBadgesGold = @"gold";
NSString *const kSOFUserBadgesSilver = @"silver";
NSString *const kSOFUserBadgesBronze = @"bronze";

@interface SOFUser ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSURL *profileImageURL;
@property (nonatomic, assign, readwrite) NSInteger reputation;
@property (nonatomic, assign, readwrite) NSInteger goldCount;
@property (nonatomic, assign, readwrite) NSInteger silverCount;
@property (nonatomic, assign, readwrite) NSInteger bronzeCount;
    
@end

@implementation SOFUser

- (instancetype)initWithJSON:(NSDictionary *)userJSON
{
    self = [super init];
    if (self) {
        _name = userJSON[kSOFUserNameField];
        _profileImageURL = userJSON[kSOFUserProfileImageURLField];
        _reputation = ((NSString *)userJSON[kSOFReputationField]).integerValue;
        _goldCount = ((NSString *)userJSON[kSOFUserBadgesCountField][kSOFUserBadgesGold]).integerValue;
        _silverCount = ((NSString *)userJSON[kSOFUserBadgesCountField][kSOFUserBadgesSilver]).integerValue;
        _bronzeCount = ((NSString *)userJSON[kSOFUserBadgesCountField][kSOFUserBadgesBronze]).integerValue;
    }
    
    return self;
}

@end
