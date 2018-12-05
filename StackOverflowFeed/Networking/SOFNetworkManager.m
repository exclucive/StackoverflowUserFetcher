//
//  SOFNetworkManager.m
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "SOFNetworkManager.h"

@implementation SOFNetworkManager

+ (NSURLSession *)configuredSession {
    return NSURLSession.sharedSession;
}

+ (void)requestWithURL:(NSURL *)url completionHandler:(void(^)(NSData * _Nullable data,
                                                               NSError * _Nullable error))completion {
    [[[SOFNetworkManager configuredSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, 
                                                                                    NSURLResponse * _Nullable response, 
                                                                                    NSError * _Nullable error) {
        if (completion) {
            // Idealy we need to handle response, but for simplicity will just handle error. It should be enough.
            completion(data, error);
        }
    }] resume];
}

@end
