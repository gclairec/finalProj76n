//
//  DBViewController.h
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface DBViewController : UIViewController{
    sqlite3 *contactDB;
}
@end
