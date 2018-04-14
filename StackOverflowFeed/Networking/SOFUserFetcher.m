//
//  UserFetcher.m
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "SOFUserFetcher.h"
#import "SOFNetworkManager.h"
#import "SOFUsersParser.h"

NSString * const kSOFUserFetcherGetUsersEndpoint = @"/2.2/users?site=stackoverflow";

@implementation SOFUserFetcher

+ (void)fetchUsersWithCompletion:(void(^)(NSError * _Nullable error, 
                                          NSArray * _Nullable users))completion {
    NSString *strUrl = [NSString stringWithFormat:@"%@%@", kAPIBaseURL, kSOFUserFetcherGetUsersEndpoint];
    NSURL *url = [NSURL URLWithString:strUrl];
    
    [SOFNetworkManager requestWithURL:url completionHandler:^(NSData *data, NSError *error) {
        if (!completion) {
            return;
        }
        
        // handle the response and errors
        dispatch_async(dispatch_get_main_queue(), ^(void){
            if (error) {
                completion(error, nil);
                return;
            } else {
                NSArray *users = [SOFUsersParser usersFromData:data];
                completion(nil, users);
            }
        });
    }];
}



@end
