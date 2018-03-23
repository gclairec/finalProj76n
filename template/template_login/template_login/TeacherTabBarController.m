//
//  TeacherTabBarController.m
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import "TeacherTabBarController.h"
#import "CourseViewController.h"

@implementation TeacherTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
    //[[(CourseViewController *)[self viewControllers] firstObject] ]
    [(CourseViewController *)[[self viewControllers] firstObject] setData:[self data]];
}

@end
