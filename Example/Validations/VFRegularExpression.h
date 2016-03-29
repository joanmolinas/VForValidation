//
//  VFRegularExpression.h
//  Validations
//
//  Created by Joan Molinas Ramon on 29/3/16.
//  Copyright © 2016 Joan Molinas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VFRegularExpression : NSObject


- (instancetype)initWithRegularExpression:(NSString *)regex
                         stringToValidate:(NSString *)stringToValidate;

- (BOOL)validate;
@end
