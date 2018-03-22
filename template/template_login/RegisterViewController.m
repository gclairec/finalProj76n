//
//  RegisterViewController.m
//  
//
//  Created by STUDENT on 22/03/2018.
//
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)backLogin:(id)sender{

}
- (IBAction)registerUser:(id)sender{
    if([_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reenterpasswordField.text isEqualToString:@""]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooooops" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }else {
        [self checkPasswordMatch];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
