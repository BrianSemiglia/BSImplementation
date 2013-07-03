//
//  ViewControllerImplementation.m
//  iChime
//
//  Created by Brian Semiglia on 6/17/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import "ViewControllerImplementation.h"
#import "ViewController.h"
#import <CoreData/CoreData.h>

@implementation ViewControllerImplementation

// Synthesizing is necessary in making instance variables, getters and setters available.
// Useful if you don't leave some outlets nil.

@synthesize publicView = _publicView;
@synthesize scrollView = _scrollView;
@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize navigationButton = _navigationButton;

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

- (UIButton *)navigationButton
{
    if (_navigationButton) {
        return _navigationButton;
    }
    
    _navigationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    _navigationButton.titleLabel.text = @"Push";
    _navigationButton.backgroundColor = [UIColor yellowColor];
    [_navigationButton addTarget:self action:@selector(performCustomSegue) forControlEvents:UIControlEventTouchUpInside];
    
    return _navigationButton;
}

- (void)performCustomSegue
{
    // Implementation decides destination and transition
    UIViewController *viewController = [[UIViewController alloc] init];
    [self.implementor.navigationController pushViewController:viewController animated:YES];
}

@end
