//
//  SOFUser.h
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOFUser : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSURL *profileImageURL;
@property (nonatomic, assign, readonly) NSInteger reputation;
@property (nonatomic, assign, readonly) NSInteger goldCount;
@property (nonatomic, assign, readonly) NSInteger silverCount;
@property (nonatomic, assign, readonly) NSInteger bronzeCount;

- (instancetype)initWithJSON:(NSDictionary *)userJSON;

@end
