//
//  RegisterViewController.h
//  
//
//  Created by STUDENT on 22/03/2018.
//
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic)IBOutlet UITextField *emailField;
@property (weak, nonatomic)IBOutlet UITextField *passwordField;
@property (weak, nonatomic)IBOutlet UITextField *reenterpasswordField;
@property (weak, nonatomic)IBOutlet UIButton *registerBtn;
@property (weak, nonatomic)IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *userType;


- (IBAction)backLogin:(id)sender;
-(IBAction)registerUser:(id)sender;
@end
