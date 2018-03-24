//
//  TeacherTabBarController.m
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import "TeacherTabBarController.h"


@implementation TeacherTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
    //[[(CourseViewController *)[self viewControllers] firstObject] ]
//    [(CourseViewController *)[[self viewControllers] firstObject] setData:[self data]];
//    [(AddCourseViewController *)[[self viewControllers] firstObject] setData:[self courses]];
    
    [(CourseViewController *)[[self viewControllers] firstObject] setData:[self data]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"afterAddCourse"]){
        NSLog(@"Inside TTBC:%@", _data);
        [(CourseViewController *)[[self viewControllers] firstObject] setData:[self courses]];
        
    }
    if([segue.identifier isEqualToString:@"teacherLogin"]){
        NSLog(@"Inside TTBC:%@", _data);
        [(CourseViewController *)[[self viewControllers] firstObject] setData:[self userInfo]];
    }
    

}





//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    AddCourseViewController *addCourseViewController = [segue destinationViewController];
//    addCourseViewController.delegate = self;
//}

@end
