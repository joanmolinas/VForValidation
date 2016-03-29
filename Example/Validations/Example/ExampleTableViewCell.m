//
//  ExampleTableViewCell.m
//  Validations
//
//  Created by Joan Molinas Ramon on 24/2/16.
//  Copyright © 2016 Joan Molinas. All rights reserved.
//

#import "ExampleTableViewCell.h"


@implementation ExampleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textField = [UITextField new];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    self.textField.frame = CGRectMake(0, 0, CGRectGetWidth(rect) - 20, CGRectGetHeight(rect)-10);
    self.textField.center = CGPointMake(CGRectGetWidth(rect)/2, CGRectGetHeight(rect)/2);
    self.textField.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.textField];
}

@end
