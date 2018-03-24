//
//  AddCourseViewController.m
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import "AddCourseViewController.h"
#import "TeacherTabBarController.h"

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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"afterAddCourse"]){
        TeacherTabBarController *targ = (TeacherTabBarController *)[segue destinationViewController];
        [targ setData:(NSArray *)sender];
    }
}
- (IBAction)addCourseBtn:(id)sender {
    if([_courseField.text isEqualToString:@""] || [_schedField.text isEqualToString:@""]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ooooops" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }else {
    NSString *query = [NSString stringWithFormat:@"insert into coursesInfo(coursename, schedule) values ('%@', '%@')", self.courseField.text, self.schedField.text];
        [self.dbManager executeQuery:query];
        if(self.dbManager.affectedRows!= 0){
            NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
            [self.delegate addingCourseWasFinished];
            [self.navigationController popViewControllerAnimated:YES];
            [self addCourse];
        }else{
            NSLog(@"Couldnot execute the query");
            
    }
    }
}

-(void) addCourse {
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have added a new course" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [success show];
    NSString *query = [NSString stringWithFormat:@"select coursename,schedule from coursesInfo"];
    // Load the relevant data.
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
//    NSLog(@"%@", results);
    if(results.count > 0) {
        // naa koy nakit.an so kuhaon nako si result
        //id result = results[0];
        NSLog(@"%@", results);
        [self performSegueWithIdentifier:@"afterAddCourse" sender:[results firstObject]];
        
    }

    
}
@end
