//
//  VFRegularExpression.h
//  Validations
//
//  Created by Joan Molinas Ramon on 29/3/16.
//  Copyright © 2016 Joan Molinas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VFRegularExpression : NSObject

/**
 Create a new Regular expression instace.
 
 @param regex: Regular expression
 @param stringToValidate: string for validat with the regex.
 */

- (instancetype)initWithRegularExpression:(NSString *)regex
                         stringToValidate:(NSString *)stringToValidate;
/**
 Validate if regex was true.
 
 @param validate
 */

- (BOOL)validate;
@end
