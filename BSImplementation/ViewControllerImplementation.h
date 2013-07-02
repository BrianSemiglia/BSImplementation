//
//  ViewControllerImplementation.h
//  iChime
//
//  Created by Brian Semiglia on 6/17/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import "ViewControllerResourceProvider.h"
#import "BSImplementation.h"

@class ViewController;
@protocol NSFetchedResultsControllerDelegate;

/*! Creates and stores objects necessary for an implementation of a class.
    The implementor cannot access the instance variables (_ivar) directly.
 */
@interface ViewControllerImplementation : NSObject
<
    BSImplementation,
    ViewControllerResourceProvider
>

/*! The object that is implementing ViewControllerImplementation.
 */
@property (nonatomic, unsafe_unretained) IBOutlet ViewController<UIScrollViewDelegate, NSFetchedResultsControllerDelegate> *implementor;

@end
