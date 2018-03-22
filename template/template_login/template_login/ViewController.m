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
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if(![defaults boolForKey:@"registered"]) {
        NSLog(@"No user registered");
        _loginBtn.hidden = YES;
    }else{
        NSLog(@"user is registered");
        _reenterpasswordField.hidden = YES;
        _registerBtn.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
} 

- (IBAction)registerUser:(id)sender{
    if([_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reenterpasswordField.text isEqualToString:@""]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooooops" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }else {
        [self checkPasswordMatch];
    }
}

- (void) checkPasswordMatch {
    if ([_passwordField.text isEqualToString:_reenterpasswordField.text]) {
        NSLog(@"Passwords Match!");
        [self registerUser];
    }else
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooooops" message:@"Your entered passwords do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
}
-(void) registerUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_emailField.text forKey:@"email"];
    [defaults setObject:_passwordField.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    [defaults synchronize];
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have registered a new user" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [success show];
}

-(IBAction)loginUser:(id)sender{
}
//
//- (IBAction)login{
//    if ([[usersDictionary objectForKey:emailField.text]isEqualToString:passwordField.text]) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Correct Password" message:@"This password is correct"delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
//        [alert show];
//    }else{
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"This password is incorrect"delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
//        [alert show];
//    }
//}


@end
