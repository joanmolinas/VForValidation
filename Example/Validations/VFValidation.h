/*
 The MIT License (MIT)
 Copyright (c) <2016> <Joan Molinas(joanmramon@gmail.com)>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


#import <Foundation/Foundation.h>

typedef BOOL(^ValidationBlock)(void);
typedef void(^ValidatedBlock)(NSString *key, BOOL validated);
typedef void(^ValidatedWithoutKey)(BOOL validated);

/*
 
 IMPORTANT TO KNOW:
 Validate != Check;
 Validate executes validation and validated block.
 Check only executes validation block.
 
 */

@interface VFValidation : NSObject

/**
 Key for store in Manager's dictionary.
 */

@property (nonatomic, strong, readonly) NSString *key;

/**
 Create a new Validation instace.
 
 @param validation: block for validation
 @param validated: return key and if validation was valid.
 */

-(instancetype)initWithValidationBlock:(ValidationBlock)validation
                        validatedBlock:(ValidatedBlock)validated;

/**
 Create a new Validation instace.
 
 @param validation: block for validation
 @param validated: return key and if validation was valid.
 @param key: key for store in Manager's dictionary.
 */

-(instancetype)initWithValidationBlock:(ValidationBlock)validation
                        validatedBlock:(ValidatedBlock)validated
                                   key:(NSString *)key;
/**
 Set validationBlock to a private property.
 
 @param validation: block for validation
 */

-(void)setValidationBlock:(ValidationBlock)validationBlock;

/**
 Set validatedBlock to a private property.
 
 @param validated: block for validated
 */

-(void)setValidatedBlock:(ValidatedBlock)validatedBlock;

/**
 Set validationBlock and validatedBlock to private properties.
 
 @param validation: block for validation
 */

-(void)setValidationBlock:(ValidationBlock)validationBlock
           validatedBlock:(ValidatedBlock)validatedBlock;

/**
 Set key to a public property.
 
 @param key.
 */

-(void)setKey:(NSString *)key;

/**
 Validate and call validationBlock and validatedBlock,
 */

-(void)validate;

/**
 Check if validationBlock was true.
 
 @param validated: Return if validationBlock was true.
 */

-(void)checkValidationWithCompletion:(ValidatedWithoutKey)validated;

/**
 Check and validate if validationBlock was true.
 
 @param validated: Return if validationBlock was true.
 */
-(void)validateAndCheckWithCompletion:(ValidatedWithoutKey)validated;


@end
