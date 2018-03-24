//
//  CourseViewController.h
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "AddCourseViewController.h"
@interface CourseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) DBManager *dbManager;
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSArray *userInfo;
@property (strong, nonatomic) NSArray *courses;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addCourseBtn;
@property (strong, nonatomic) IBOutlet UITableView *tblCourses;
- (IBAction)addCourseBtn:(id)sender;
-(void)loadData;
@end
