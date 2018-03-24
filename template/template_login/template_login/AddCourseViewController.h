//
//  AddCourseViewController.h
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import <UIKit/UIKit.h>
#import "DBManager.h"


@protocol AddCourseViewControllerDelegate

-(void)addingCourseWasFinished;

@end

@interface AddCourseViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) NSArray *data;

@property (strong, nonatomic) NSArray *courses;
@property (strong, nonatomic) IBOutlet UITextField *courseField;
@property (strong, nonatomic) IBOutlet UITextField *schedField;
@property (nonatomic, strong) id<AddCourseViewControllerDelegate> delegate;

- (IBAction)addCourseBtn:(id)sender;
- (void) addCourse;

@end
