//
//  AuthenticationController.h
//  MyTask
//
//  Created by Marshal Wu on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthenticationController : UIViewController{
    
    __weak IBOutlet  UITextField *userNameField;
     __weak IBOutlet UITextField *passWordField;
}
- (IBAction)login:(id)sender;
@end
