//
//  VFRegularExpression.m
//  Validations
//
//  Created by Joan Molinas Ramon on 29/3/16.
//  Copyright © 2016 Joan Molinas. All rights reserved.
//

#import "VFRegularExpression.h"

@interface VFRegularExpression ()
@property (nonatomic) NSRegularExpression *regex;
@property (nonatomic) NSString *stringToValidate;

@end

@implementation VFRegularExpression

- (instancetype)initWithRegularExpression:(NSString *)regex
                         stringToValidate:(NSString *)stringToValidate {
    
    if (self = [super init]) {
        _stringToValidate = stringToValidate;
        NSError *error;
        
        _regex = [NSRegularExpression regularExpressionWithPattern:regex
                                                           options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSAssert(_regex, @"Unable to create regular expression");
    }
    
    return self;
}

- (BOOL)validate {
    NSRange textRange = NSMakeRange(0, self.stringToValidate.length);
    NSRange matchRange = [_regex rangeOfFirstMatchInString:self.stringToValidate
                                                   options:NSMatchingReportProgress
                                                     range:textRange];
    return matchRange.location != NSNotFound;
}

@end
