//
//  ViewController.m
//  Implementations
//
//  Created by Brian Semiglia on 6/17/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Implementation.h"
#import <CoreData/CoreData.h>

@implementation ViewController

- (id)initWithImplementationWithName:(NSString *)implementationName
{
    if (self = [super init]) {
        _implementation = [UIViewController implementationWithClassName:implementationName];
        _implementation.implementor = self;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.publicView];

    for (id object in self.fetchedResultsController.fetchedObjects) {
        NSLog(@"%@", object);
    }
}

#pragma mark - Message Forwarding

// Messages sent to dynamic properties will be forwarded to the implementation object(s).
// Remove dynamic declaration to prevent getter/setter selectors from being forwarded.

@dynamic publicView;
@dynamic scrollView;
@dynamic fetchedResultsController;

- (void)forwardInvocation:(NSInvocation *)invocation {
	if (!self.implementation) {
		[self doesNotRecognizeSelector:invocation.selector];
	}
	[invocation invokeWithTarget:self.implementation];
}

- (NSMethodSignature*)methodSignatureForSelector:(SEL)selector {
	NSMethodSignature *signature = [super methodSignatureForSelector:selector];
	if (!signature) {
		signature = [self.implementation methodSignatureForSelector:selector];
	}
	return signature;
}

@end
