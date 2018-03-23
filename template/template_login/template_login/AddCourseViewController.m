//
//  AddCourseViewController.m
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import "AddCourseViewController.h"

@implementation AddCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.fnameField.delegate = self;
//    self.lnameField.delegate = self;
//    self.emailField.delegate = self;
//    self.passwordField.delegate = self;
//    self.reenterpasswordField.delegate = self;
    self.courseField.delegate = self;
    self.schedField.delegate = self;
    
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

- (IBAction)addCourseBtn:(id)sender {
    if([_courseField.text isEqualToString:@""] || [_schedField.text isEqualToString:@""]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooooops" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }else {
    NSString *query = [NSString stringWithFormat:@"insert into courseInfo(coursename, schedule) values ('%@', '%@')", self.courseField.text, self.schedField.text];
        [self.dbManager executeQuery:query];
        if(self.dbManager.affectedRows!= 0){
            NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            NSLog(@"Couldnot execute the query");
    }
    }
}
@end
