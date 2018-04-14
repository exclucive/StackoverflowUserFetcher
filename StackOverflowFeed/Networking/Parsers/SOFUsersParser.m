//
//  UsersParser.m
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "SOFUsersParser.h"
#import "SOFUser.h"

NSString *const kSOFUsersParserItemsField = @"items";

@implementation SOFUsersParser

+ (NSArray *)usersFromData:(NSData *)usersData {
    NSError *jsonError;
    NSDictionary *usersJSON = [NSJSONSerialization JSONObjectWithData:usersData options:kNilOptions error:&jsonError];    
    NSArray *users = usersJSON[kSOFUsersParserItemsField];
    
    NSMutableArray *resultArray;
    if (!jsonError && users) {
        resultArray = [NSMutableArray arrayWithCapacity:users.count];
        for (NSDictionary *userJSON in users) {
            SOFUser *user = [[SOFUser alloc] initWithJSON:userJSON];
            [resultArray addObject:user];
        }
    }
    
    return resultArray;
}

@end
