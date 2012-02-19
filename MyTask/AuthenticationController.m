//
//  AuthenticationController.m
//  MyTask
//
//  Created by Marshal Wu on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AuthenticationController.h"
#import "DataManager.h"
@implementation AuthenticationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
     [userNameField becomeFirstResponder];
    userNameField.text=@"Sullivan";
    passWordField.text=@"password";
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

- (IBAction)login:(id)sender {
    [userNameField resignFirstResponder];
    [passWordField resignFirstResponder];
    if (userNameField.text.length&&passWordField.text.length) {
        if ([[DataManager shareInstance] checkName:userNameField.text password:passWordField.text]) {
             self.view.window.rootViewController=tabBarController;
        }else{
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名或密码不正确！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }else{
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名或密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    userNameField.text=@"";
    passWordField.text=@"";
    [userNameField becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case 0:
            [passWordField becomeFirstResponder];
            break;
        case 1:
            [self login:nil];
            break;
        default:
            break;
    }
    return YES;
}
@end
