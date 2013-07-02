//
//  ViewControllerImplementation.m
//  iChime
//
//  Created by Brian Semiglia on 6/17/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import "ViewControllerImplementation.h"
#import <CoreData/CoreData.h>

@implementation ViewControllerImplementation

// Synthesizing is necessary in making instance variables, getters and setters available.
@synthesize publicView = _publicView;
@synthesize scrollView = _scrollView;
@synthesize fetchedResultsController = _fetchedResultsController;

- (UIView *)publicView
{    
    if (_publicView) {
        return _publicView;
    }
    
    _publicView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _publicView.backgroundColor = [UIColor redColor];
    
    return _publicView;
}

- (UIScrollView *)scrollView
{
    if (_scrollView) {
        return _scrollView;
    }
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.publicView.frame];
    _scrollView.delegate = self.implementor;
    
    return _scrollView;
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController) {
        return _fetchedResultsController;
    }
    
    // Predicate logic...
    _fetchedResultsController = [[NSFetchedResultsController alloc] init];
    _fetchedResultsController.delegate = self.implementor;
    // Possibly perform fetch...
    
    return _fetchedResultsController;
}

@end
