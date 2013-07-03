//
//  BSViewController.h
//  BSImplementation
//
//  Created by Brian on 7/3/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSImplementation.h"

/*! A UIViewController that includes methods for assigning an implementation and forwarding selectors to it.
 *  \discussion If you'd rather not use a subclass, you can simply add the included methods to your UIViewControllers.
 */
@interface BSViewController : UIViewController

/*! Instantiates an instance of BSViewController with an implementation of the provided name.
 */
- (id)initWithImplementationWithName:(NSString *)implementationName;

/*! The resource provider to which all necessary resouce selectors will be forwarded to.
 *  \discussion Declared as an IBOutlet to allow for the assignment via Interface Builder. This could be useful in using Interface Builder in addition to an implementation. Data sources, services, etc. could be provided by the implementation while the UI elements provided by Interface Builder.
 */
@property (nonatomic, strong) IBOutlet NSObject <BSImplementation> *implementation;

@end
