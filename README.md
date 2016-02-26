# V For Validation

>Imagine the next scenario: You have an awesome app, probably you use a form for register
>users, or maybe you need check when one field is valid or not...
>I'm pretty sure that you use a simple way to check each textField, switch...
>V For Validation try to help you for do it possible with an easy way.

## How it works

**IMPORTANT TO KNOW:** 

    Validate != Check

- Validate executes validation and validated block.
- Check only executes validation block.

VFV have 2 parts:

  - *VFValidationManager.h*: Contains all validations and It's responsible to check and validate.
  - *VFValidation.h*: Check what needs validate and what happens when did it.
  

## Installation

### Manual
Drag and drop or copy Source Folder into your project.

## Pod
*Soon*

##Carthage 
*Soon*

##Getting started
  
  1. Import library
  ```Objective-C
  #import "VForValidation.h"
  ```
 
  2. Create Manager
  ```Objective-C
  ///@interface
  @property (nonatomic, strong) VFValidationManager *validationManager;
  
  ///-(void)viewDidLoad
  self.validationManager = [[VFValidationManager alloc] init];
  ```
 
  3. Creates validation
  ```Objective-C
    VFValidation *validation = [[VFValidation alloc] initWithValidationBlock:^BOOL{
        return 1 != 2;
    } validatedBlock:^(NSString *key, BOOL validated) {
        if (validated) NSLog(@"True");
        else NSLog(@"False");
    } key:@"key"];
    ```
  4. Add Validation
  ```Objective-C
  [self.validationManager addValidation:validation]; 
  ```
  
  5. When you want, VALIDATE!
  ```Objective-C
  [self.validationManager validate];
  ```
  
##API
  - *VFValidationManager.h*
  ```Objective-C
   ///Constructors
    -(instancetype)initWithValidations:(NSArray *)validations;
    
     ///Adders
    -(void)addValidation:(VFValidation *)validation;
    -(void)addValidations:(NSArray *)validations;
    
    ///Modifiers
    -(void)updateValidation:(VFValidation *)validation;
    
    ///Getters
    -(VFValidation *)validationByKey:(NSString *)key;
    -(NSArray *)validations;
    
    ///Validate and Check
    -(void)validateByKey:(NSString *)key;
    -(void)checkIfAllWasValidWithCompletion:(ValidatedWithoutKey)validated;
    -(void)validateAndCheckIfAllWasValidWithCompletion:(ValidatedWithoutKey)validated;
  ```

  
  - *VFValidation.h*
  ```Objective-C
  ///Constructors
    -(instancetype)initWithValidationBlock:(ValidationBlock)validation
                            validatedBlock:(ValidatedBlock)validated;
    -(instancetype)initWithValidationBlock:(ValidationBlock)validation
                            validatedBlock:(ValidatedBlock)validated
                                       key:(NSString *)key;
  ///Setters
    -(void)setValidationBlock:(ValidationBlock)validationBlock;
    -(void)setValidatedBlock:(ValidatedBlock)validatedBlock;
    -(void)setValidationBlock:(ValidationBlock)validationBlock
               validatedBlock:(ValidatedBlock)validatedBlock;
    -(void)setKey:(NSString *)key;
    
  ///Validate and Check
    -(void)validate;
    -(void)checkValidationWithCompletion:(ValidatedWithouKey)validated;
    -(void)validateAndCheckWithCompletion:(ValidatedWithouKey)validated;
  ```

## TO-DO:
    - Execute validation blocs in a thread.
    - Refactor names.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b VFV-new-feature`
3. Commit your changes: `git commit -am 'Add new feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request 👌

## Credits
 - Joan Molinas ([website](www.joanmolinas.com))

## License

VFV is available under the MIT license.

