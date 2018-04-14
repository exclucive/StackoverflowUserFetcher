//
//  UsersParser.h
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOFUsersParser : NSObject

+ (NSArray *)usersFromData:(NSData *)usersData;

@end
