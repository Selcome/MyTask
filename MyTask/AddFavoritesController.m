//
//  AddFavoritesController.m
//  MyTask
//
//  Created by marcus wang on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AddFavoritesController.h"
#import "FavoritesData.h"
#import "pinyin.h"
@implementation AddFavoritesController
@synthesize favoritesData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=@"添加";
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(IBAction)onClickButton:(id)sender
{
    [userNameField resignFirstResponder];
    [sexField resignFirstResponder];
    
    if (userNameField.text.length&&sexField.text.length) {
        NSString *fullname=[userNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        char zimu=pinyinFirstLetter([fullname characterAtIndex:0]);
        NSDictionary *dir= [NSDictionary dictionaryWithObjectsAndKeys:userNameField.text,@"name",[NSString stringWithFormat:@"%c",zimu],@"firstName",sexField.text,@"sex",nil];
        [favoritesData addFavorites:dir]; 
        [self.navigationController popViewControllerAnimated:YES]; 
    }else{
    
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"警告" message:@"姓名或性别不能为空。" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
}

- (IBAction)onTapGesture:(id)sender {
    [userNameField resignFirstResponder];
    [sexField resignFirstResponder];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ![touch.view isKindOfClass:[UIButton class]];
}
@end
