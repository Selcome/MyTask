//
//  HomeController.h
//  MyTask
//
//  Created by Marshal Wu on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeController : UIViewController{
    __weak IBOutlet UIImageView *userImage;
    __weak IBOutlet UIScrollView *scrollView;
    
}
- (IBAction)gotoAction:(id)sender;

@end
