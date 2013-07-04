//
//  BSViewController.m
//  BSImplementation
//
//  Created by Brian on 7/3/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import "BSViewController.h"
#import "NSObject+Implementation.h"

@interface BSViewController ()
@end

@implementation BSViewController

- (id)initWithImplementationWithName:(NSString *)implementationName
{
    if (self = [super init]) {
        _implementation = [NSObject implementationWithClassName:implementationName];
        _implementation.implementor = self;
    }
    
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return self.implementation;
}

@end
