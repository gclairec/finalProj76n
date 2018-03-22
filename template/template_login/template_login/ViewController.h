//
//  ViewController.h
//  template_login
//
//  Created by STUDENT on 22/03/2018.
//  Copyright (c) 2018 Gillian Claire Cancio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic)IBOutlet UITextField *emailField;
@property (weak, nonatomic)IBOutlet UITextField *passwordField;
@property (weak, nonatomic)IBOutlet UITextField *reenterpasswordField;
@property (weak, nonatomic)IBOutlet UIButton *registerBtn;
@property (weak, nonatomic)IBOutlet UIButton *loginBtn;
    


- (IBAction)loginUser:(id)sender;
-(IBAction)registerUser:(id)sender;
@end
