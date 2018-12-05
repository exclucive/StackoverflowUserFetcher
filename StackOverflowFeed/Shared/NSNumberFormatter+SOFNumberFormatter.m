//
//  NSNumberFormatter+SOFNumberFormatter.m
//  StackOverflowFeed
//
//  Created by Igor Novik on 12/4/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "NSNumberFormatter+SOFNumberFormatter.h"

@implementation NSNumberFormatter (SOFNumberFormatter)

-(NSString *)decimalFormatedStringFromNumber:(NSNumber *)number {
    self.numberStyle = NSNumberFormatterDecimalStyle;
    return [self stringFromNumber:number];
}
    
@end
