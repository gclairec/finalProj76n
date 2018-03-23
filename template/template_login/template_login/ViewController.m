//
//  ViewController.m
//  template_login
//
//  Created by STUDENT on 22/03/2018.
//  Copyright (c) 2018 Gillian Claire Cancio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.emailField.delegate = self;
    self.passwordField.delegate = self;
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"schoolyDB"];
//    // Do any additional setup after loading the view, typically from a nib.
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
//    if(![defaults boolForKey:@"registered"]) {
//        NSLog(@"No user registered");
//        _loginBtn.hidden = YES;
//    }else{
//        
//    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)registerBtn:(id)sender {
}
- (IBAction)loginBtn:(id)sender {
}

- (IBAction)loginUser:(id)sender {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
//    
//    if([_emailField.text isEqualToString:[defaults objectForKey:@"email"]] && [_passwordField.text isEqualToString:[defaults objectForKey:@"password"]]) {
//        NSLog(@"Login credentials accepted");
//    }else {
//        NSLog(@"Login credentials incorrect");
//        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooooops" message:@"Your username and password do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [error show];
//    }
    if(_userType.selectedSegmentIndex)
    {
        NSString *query = @"select email, password from studentInfo where email=%@, password =%@", self._emailField, self._passwordField;
    }
    
    
    
}

- (IBAction)registerUser:(id)sender {
}
@end
