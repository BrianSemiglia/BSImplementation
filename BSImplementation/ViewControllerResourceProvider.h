//
//  ViewControllerOutlets.h
//  Implementations
//
//  Created by Brian on 6/29/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSFetchedResultsController;

@protocol ViewControllerResourceProvider <NSObject>
@property (nonatomic, strong) UIView *publicView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) UIButton *navigationButton;

- (void)performCustomSegue;

@end
