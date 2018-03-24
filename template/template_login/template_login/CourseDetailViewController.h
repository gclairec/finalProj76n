//
//  CourseDetailViewController.h
//  
//
//  Created by CEAC-TC on 24/03/2018.
//
//

#import <UIKit/UIKit.h>

@interface CourseDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *courseName;
@property (strong, nonatomic) IBOutlet UILabel *courseSched;
@property (strong, nonatomic) IBOutlet UIButton *addNotif;
@property (strong, nonatomic) NSArray *course;
@property (strong, nonatomic) NSArray *data;

- (IBAction)addNotif:(id)sender;

@end
