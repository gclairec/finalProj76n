//
//  NotifViewController.h
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import <UIKit/UIKit.h>

@interface NotifViewController : UIViewController
@property (strong, nonatomic) NSArray *data;

- (IBAction)onLogout:(id)sender;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end
