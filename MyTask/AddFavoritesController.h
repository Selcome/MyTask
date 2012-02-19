//
//  AddFavoritesController.h
//  MyTask
//
//  Created by marcus wang on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FavoritesData;
@interface AddFavoritesController : UIViewController
{
    __weak IBOutlet UITextField *userNameField;
    __weak IBOutlet UITextField *sexField;
    
    FavoritesData *favoritesData;
}
@property(nonatomic,strong) FavoritesData *favoritesData;
-(IBAction)onClickButton:(id)sender;
- (IBAction)onTapGesture:(id)sender;
@end
