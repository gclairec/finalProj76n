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
    self.fnameField.delegate = self;
    self.lnameField.delegate = self;
    self.emailField.delegate = self;
    self.passwordField.delegate = self;
    self.reenterpasswordField.delegate = self;
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"schoolyDB"];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backLogin:(id)sender {
}

- (IBAction)registerUser:(id)sender{
    if([_fnameField.text isEqualToString:@""] || [_lnameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reenterpasswordField.text isEqualToString:@""]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooooops" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }else {
        [self checkPasswordMatch];
        NSLog(@"%ld", (long)self.userType.selectedSegmentIndex);
        if(_userType.selectedSegmentIndex)
        {
            NSString *query = [NSString stringWithFormat:@"insert into studentInfo(firstname, lastname, email, password) values ('%@', '%@', '%@', '%@')", self.fnameField.text, self.lnameField.text, self.emailField.text, self.passwordField.text];
            [self.dbManager executeQuery:query];
            
            if(self.dbManager.affectedRows!= 0){
                NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
                
                [self.navigationController popViewControllerAnimated:YES];
                
            }else{
                NSLog(@"Couldnot execute the query");
            }
        }else
        {
            NSString *query = [NSString stringWithFormat:@"insert into teacherInfo(firstname, lastname, email, password) values ('%@', '%@', '%@', '%@')", self.fnameField.text, self.lnameField.text, self.emailField.text, self.passwordField.text];
            [self.dbManager executeQuery:query];
            
            if(self.dbManager.affectedRows!= 0){
                NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
                
                [self.navigationController popViewControllerAnimated:YES];
                
            }else{
                NSLog(@"Couldnot execute the query");
            }
            
        }
        //add something here
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
