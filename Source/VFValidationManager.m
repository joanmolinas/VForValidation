/*
 The MIT License (MIT)
 Copyright (c) <2016> <Joan Molinas(joanmramon@gmail.com)>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "VFValidationManager.h"

@implementation VFValidationManager {
    NSMapTable *_validations;
}

+(void)missingParameters {
    NSAssert(false, @"Missing correct parameters");
}

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if(self) {
        [self _setupMapTables];
    }
    
    return self;
}

- (instancetype)initWithValidations:(NSArray *)validations {
    self = [super init];
    if (self) {
        [self addValidations:validations];
    }
    
    return self;
}

#pragma mark - Add Validations
- (void)addValidation:(VFValidation *)validation {
    if (!validation.key || !validation ) { [[self class] missingParameters]; }
    
    [_validations setObject:validation forKey:validation.key];
}

- (void)addValidations:(NSArray *)validations {
    if (validations.count < 1) { return; }
    for (VFValidation *v in validations) {
        [self addValidation:v];
    }
}

#pragma mark - Validates

- (void)validate {
    for (NSString *key in [[_validations keyEnumerator] allObjects]) {
        [self validateByKey:key];
    }
}

- (void)validateByKey:(NSString *)key {
    if (!key) { [[self class] missingParameters]; }
    VFValidation *v = [_validations objectForKey:key];
    [v validate];
    
}

- (void)checkIfAllWasValidWithCompletion:(ValidatedWithoutKey)validated {
    __block BOOL allWasValid = true;
    int i = 0;
    NSArray *keys = [[_validations keyEnumerator] allObjects];

    while (allWasValid && i<[keys count]) {
        NSString *key = [keys objectAtIndex:i++];
        VFValidation *v = [_validations objectForKey:key];
        [v checkValidationWithCompletion:^(BOOL validated) {
            allWasValid = validated;
        }];
    }
    
    validated(allWasValid);
}

- (void)validateAndCheckIfAllWasValidWithCompletion:(ValidatedWithoutKey)validated {
    [self validate];
    [self checkIfAllWasValidWithCompletion:validated];
}

#pragma mark - Getters

- (VFValidation *)validationByKey:(NSString *)key {
    if (!key) { [[self class] missingParameters]; }
    return [_validations objectForKey:key];
}

- (NSArray *)validations {
    return [[_validations objectEnumerator] allObjects];
}

#pragma mark - Updates

- (void)updateValidation:(VFValidation *)validation {
    [self addValidation:validation];
}

#pragma mark - Private API

- (void)_setupMapTables {
    _validations = [NSMapTable
                    mapTableWithKeyOptions:NSMapTableWeakMemory
                    valueOptions:NSMapTableStrongMemory];
}
@end
