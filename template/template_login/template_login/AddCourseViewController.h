//
//  AddCourseViewController.h
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
@interface AddCourseViewController : UIViewController
@property (nonatomic, strong) DBManager *dbManager;

@property (strong, nonatomic) IBOutlet UITextField *courseField;
@property (strong, nonatomic) IBOutlet UITextField *schedField;
@property (strong, nonatomic) IBOutlet UIButton *addCourseBtn;


- (IBAction)addCourseBtn:(id)sender;

@end
