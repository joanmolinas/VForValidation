/*
 The MIT License (MIT)
 Copyright (c) <2016> <Joan Molinas(joanmramon@gmail.com)>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import <Foundation/Foundation.h>
#import "VFValidation.h"

/*

 IMPORTANT TO KNOW:
 Validate != Check;
 Validate executes validation and validated block.
 Check only executes validation block.
 
 */

@interface VFValidationManager : NSObject

/**
 Init with an validation arrays
 
 @param validations
 
 */

-(instancetype)initWithValidations:(NSArray *)validations;

/**
 Add one valiation to validations dictionary, validation contains our key.
 
 @param validation
 
 */

-(void)addValidation:(VFValidation *)validation;

/**
 Add an validations array
 
 @param validations: validations array
 
 */

-(void)addValidations:(NSArray *)validations;

/**
 Update validation using the key
 
 @param validation
 
 */

-(void)updateValidation:(VFValidation *)validation;

/**
 Get validation by key
 
 @param key: used for store validations
 
 @return validation
 
 */

-(VFValidation *)validationByKey:(NSString *)key;

/**
 Get all validations.
 
 @return validations
 
 */

-(NSArray *)validations;

/**
 Validate all the validations. Check and execute validation and validated for 
 each validation.
 
 */

-(void)validate;

/**
 Validate only one validation using his key.
 
 @param key: used for store validations
 
 */

-(void)validateByKey:(NSString *)key;

/**
 Check if all validation was valid. Manager iterates all the validations and will
 execute the validationBlock and return if was valid.
 If all the validations was valid, validated will be true, if one didn't pass, 
 validated will be false;
 
 @param validated: return if all validations was true.
 
 */

-(void)checkIfAllWasValidWithCompletionBlock:(ValidatedWithouKey)validated;

/**
  - Check and validate if all validation was valid. Manager iterates all the
 validations and will execute the validationBlock and return if was valid.
 If all the validations was valid, validated will be true, if one didn't pass,
 validated will be false;
 
 - Also, executes validatedBlock
 
 @param validated: return if all validations was true.
 
 */
-(void)validateAndCheckIfAllWasValidWithCompletionBlock:(ValidatedWithouKey)validated;

@end
