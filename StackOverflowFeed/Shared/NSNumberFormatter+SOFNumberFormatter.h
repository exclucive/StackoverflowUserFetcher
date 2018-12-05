//
//  NSNumberFormatter+SOFNumberFormatter.h
//  StackOverflowFeed
//
//  Created by Igor Novik on 12/4/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumberFormatter (SOFNumberFormatter)

-(NSString *)decimalFormatedStringFromNumber:(NSNumber *)number;
    
@end

NS_ASSUME_NONNULL_END
