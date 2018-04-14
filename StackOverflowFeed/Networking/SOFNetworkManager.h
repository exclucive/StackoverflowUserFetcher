//
//  SOFNetworkManager.h
//  StackOverflowFeed
//
//  Created by Igor Novik on 4/13/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOFNetworkManager : NSObject

+ (void)requestWithURL:(NSURL *)url completionHandler:(void(^)(NSData *data, NSError *error))completion;

@end
