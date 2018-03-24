//
//  ViewController.m
//  template_login
//
//  Created by STUDENT on 22/03/2018.
//  Copyright (c) 2018 Gillian Claire Cancio. All rights reserved.
//

#import "ViewController.h"
#import "TeacherTabBarController.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.emailField.delegate = self;
//    self.passwordField.delegate = self;
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

- (void)hideKeyboard {
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}
- (IBAction)registerBtn:(id)sender {
}
- (IBAction)loginBtn:(id)sender {
    [self hideKeyboard];

}

-(void)unwindToVC:(UIStoryboardSegue*)segue {}


-(void) loginHandler {
    if(_userType.selectedSegmentIndex==0)
    {
        NSString *query = [NSString stringWithFormat:@"select * from teacherInfo where email='%@' and password ='%@'", _emailField.text, _passwordField.text ];
        // Load the relevant data.
        NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        NSLog(@"Login handler %@", results);
        if(results.count > 0) {
            // naa koy nakit.an so kuhaon nako si result
            //id result = results[0];
            _userInfo = [results firstObject];
            NSLog(@"before perform segue %@", _userInfo);
            [self performSegueWithIdentifier:@"teacherLogin" sender:[results firstObject]];
        
        }else{
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooooops" message:@"Your username and password do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [error show];
        }

    }
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
    [self loginHandler];
    
    
}

- (IBAction)registerUser:(id)sender {
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     NSLog(@"UserInfo: %@", _userInfo);
     if([segue.identifier isEqualToString:@"teacherLogin"]){
         TeacherTabBarController *targ = (TeacherTabBarController *)[segue destinationViewController];
         [targ setData:_userInfo];
         NSLog(@"After Set Data %@",_userInfo);
     }
 }

@end
