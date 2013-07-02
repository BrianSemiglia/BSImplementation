//
//  ViewController.h
//  Implementations
//
//  Created by Brian Semiglia on 6/17/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerResourceProvider.h"
#import "BSImplementation.h"

@class BSImplementation;

@interface ViewController : UIViewController <ViewControllerResourceProvider>

/*! Instantiates an instance of ViewController with an implementation of the provided name. 
 */
- (id)initWithImplementationWithName:(NSString *)implementationName;

/*! The resource provider to which all necessary resouce selectors will be forwarded to.
 *  \discussion Declared as an IBOutlet to allow for the assignment via Interface Builder. This could be useful in using Interface Builder in addition to an implementation. Data sources, services, etc. could be provided by the implementation while the UI elements provided by Interface Builder.
 */
@property (nonatomic, strong) IBOutlet NSObject <BSImplementation> *implementation;

@end
