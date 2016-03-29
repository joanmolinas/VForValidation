//
//  ExampleTableViewController.m
//  Validations
//
//  Created by Joan Molinas Ramon on 24/2/16.
//  Copyright © 2016 Joan Molinas. All rights reserved.
//

#import "ExampleTableViewController.h"
#import "ExampleTableViewCell.h"
#import "VForValidation.h"
#import "VFRegularExpression.h"

#define REUSE_IDENTIFIER @"cellIdentifier"

@interface ExampleTableViewController ()
@property (nonatomic, strong) VFValidationManager *v;
@end

@implementation ExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ExampleTableViewCell class] forCellReuseIdentifier:REUSE_IDENTIFIER];
    
    self.v = [[VFValidationManager alloc] init];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER forIndexPath:indexPath];
    cell.textField.placeholder = @"Input text";
    [self.v addValidation:[self validationForIndexPath:indexPath
                                                  cell:cell]];

    return cell;
}

- (IBAction)Validate:(UIButton *)sender {
    [self.v validateAndCheckIfAllWasValidWithCompletion:^(BOOL validated) {
        if (validated) {
            sender.backgroundColor = [UIColor greenColor];
        } else {
            sender.backgroundColor = [UIColor redColor];
        }
    }];
}

- (VFValidation *)validationForIndexPath:(NSIndexPath *)indexPath
                                 cell:(ExampleTableViewCell *)cell {
        
    __block ExampleTableViewCell *c = cell;
    ValidationBlock validation;
    switch (indexPath.row) {
        case 0:
            validation = ^BOOL{
                return c.textField.text.length > 4;
            };
            break;
        case 1:
            validation = ^BOOL{
                return c.textField.text.length > 7;
            };
            break;
        case 2:
            validation = ^BOOL{
                return [c.textField.text isEqualToString:@"Hoho"];
            };
            break;
        case 3:
            validation = ^BOOL{
                return [c.textField.text isEqualToString:@"App"];
            };
            break;
        case 4:
            validation = ^BOOL{
                return c.textField.text.length == 1;
            };
            break;
        case 5:
            c.textField.placeholder = @"email with regex";
            validation = ^BOOL{
                VFRegularExpression *regex = [[VFRegularExpression alloc] initWithRegularExpression:@"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$" stringToValidate:c.textField.text];
                return [regex validate];
            };
            break;
        default:
            break;
    }
    
    ValidatedBlock validated = ^(NSString *key, BOOL validated) {
        NSLog(@"%d", validated);
        if (!validated) {
            cell.textField.backgroundColor = [UIColor redColor];
        } else {
            cell.textField.backgroundColor = [UIColor greenColor];
        }
    };
    
    VFValidation *v = [[VFValidation alloc] initWithValidationBlock:validation
                                                 validatedBlock:validated
                                                            key:[NSString
                                                                 stringWithFormat:@"%ld",
                                                                 (long)indexPath.row]];
    
    return v;
}
@end

