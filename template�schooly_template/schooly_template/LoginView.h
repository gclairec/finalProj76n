//
//  LoginView.h
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface LoginView : UIView

@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *btnLogin;

- (void)showAlert;


@end
