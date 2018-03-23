//
//  ViewController.h
//  template_login
//
//  Created by STUDENT on 22/03/2018.
//  Copyright (c) 2018 Gillian Claire Cancio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController : UIViewController
@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) NSArray *userInfo;
@property (weak, nonatomic)IBOutlet UITextField *emailField;
@property (weak, nonatomic)IBOutlet UITextField *passwordField;
@property (weak, nonatomic)IBOutlet UIButton *registerBtn;
@property (weak, nonatomic)IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *userType;
    


-(IBAction)loginUser:(id)sender;
-(IBAction)registerUser:(id)sender;
@end
