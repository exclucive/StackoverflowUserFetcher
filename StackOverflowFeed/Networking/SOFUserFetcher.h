//
//  SOFUserFetcher.h
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOFUserFetcher : NSObject

+ (void)fetchUsersWithCompletion:(void(^)(NSError * _Nullable error, 
                                          NSArray * _Nullable users))completion;

@end
