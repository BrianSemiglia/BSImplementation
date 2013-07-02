//
//  BSImplementation.h
//  iChime
//
//  Created by Brian Semiglia on 6/17/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Implementation)

/*! Returns an implementation instantiated from the provided class name.
 */
+ (id)implementationWithClassName:(NSString *)className;

@end
