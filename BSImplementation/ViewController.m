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

// The compiler will warn about the missing performCustomSegue method but this can be ignored.

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.publicView];
    [self.view addSubview:self.navigationButton];

    for (id object in self.fetchedResultsController.fetchedObjects) {
        NSLog(@"%@", object);
    }
}

#pragma mark - Message Forwarding

// Messages sent to dynamic properties will be forwarded to the implementation object.
// Remove dynamic declaration to prevent getter/setter selectors from being forwarded.

@dynamic publicView;
@dynamic scrollView;
@dynamic fetchedResultsController;
@dynamic navigationButton;

@end
