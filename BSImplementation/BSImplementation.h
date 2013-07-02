//
//  BSImplementationProtocol.h
//  Implementations
//
//  Created by Brian on 7/1/13.
//  Copyright (c) 2013 Brian Semiglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BSImplementation <NSObject>

/*! The object that is implementing the implementation.
 */
@property (nonatomic, unsafe_unretained) IBOutlet id implementor;

@end
