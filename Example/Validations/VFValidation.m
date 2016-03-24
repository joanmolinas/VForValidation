/* 
 The MIT License (MIT)
 Copyright (c) <2016> <Joan Molinas(joanmramon@gmail.com)>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "VFValidation.h"

@interface VFValidation ()
@property (nonatomic, copy) ValidationBlock validationBlock;
@property (nonatomic, copy) ValidatedBlock validatedBlock;
@end

@implementation VFValidation

#pragma mark - Inits
-(instancetype)initWithValidationBlock:(ValidationBlock)validation validatedBlock:(ValidatedBlock)validated {
    self = [self initWithValidationBlock:validation
                          validatedBlock:validated
                                     key:nil];
    return self;
}

-(instancetype)initWithValidationBlock:(ValidationBlock)validation
                        validatedBlock:(ValidatedBlock)validated
                                   key:(NSString *)key {
    if (self = [super init]) {
        [self setValidationBlock:validation
                  validatedBlock:validated];
        [self setKey:key];
    }
    
    return self;
}

#pragma mark - Setters
-(void)setValidationBlock:(ValidationBlock)validationBlock {
    if (!validationBlock) { return; }
    _validationBlock = [validationBlock copy];
}

-(void)setValidatedBlock:(ValidatedBlock)validatedBlock {
    if (!validatedBlock) { return; }
    _validatedBlock = [validatedBlock copy];
}

-(void)setKey:(NSString *)key {
    if (!key) { return; }
    _key = key;
}

-(void)setValidationBlock:(ValidationBlock)validationBlock
           validatedBlock:(ValidatedBlock)validatedBlock {
    [self setValidatedBlock:validatedBlock];
    [self setValidationBlock:validationBlock];
}

#pragma mark - Public API
-(void)validate {
    __unsafe_unretained typeof(self) weakSelf = self;
    _validatedBlock(weakSelf.key, _validationBlock());
}

-(void)checkValidationWithCompletion:(ValidatedWithoutKey)validated {
    validated(_validationBlock());
}

-(void)validateAndCheckWithCompletion:(ValidatedWithoutKey)validated {
    [self validate];
    [self checkValidationWithCompletion:validated];
}
@end
