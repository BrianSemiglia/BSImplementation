//
//  BSImplementation.m
//  iChime
//
//  Created by Brian Semiglia on 6/17/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import "BSImplementation.h"

@implementation NSObject (Implementation)

+ (id)implementationWithClassName:(NSString *)className
{
    Class ImplementationClass = NSClassFromString(className);
    id implementation = [[ImplementationClass alloc] init];
    return implementation;
}

@end
