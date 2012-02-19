//
//  HomeController.m
//  MyTask
//
//  Created by Marshal Wu on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomeController.h"
#import "TaskController.h"
#import "SettingViewController.h"
#import "ActivityController.h"
@interface HomeController()
-(void)setUserImage;
@end

@implementation HomeController

-(void)setUserImage{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory
                                                       , NSUserDomainMask 
                                                       , YES); 
    NSString *newImagePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"sullivan_new.png"]; 
    
    
    NSString *imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"sullivan.png"];
    
    [[NSFileManager defaultManager] copyItemAtURL:[NSURL fileURLWithPath:imagePath] toURL:[NSURL fileURLWithPath:newImagePath] error:nil];
    userImage.image=[UIImage imageWithContentsOfFile:newImagePath];
}

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
    self.navigationItem.title=@"怪兽电力公司";
    [scrollView setContentSize:CGSizeMake(320, 470)];
    [self setUserImage];
}

- (void)viewDidUnload
{
    userImage = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)gotoAction:(id)sender {
    UIButton *button=(UIButton *)sender;
    int tag=button.tag;
    
    switch (tag) {
        case 1:
            NSLog(@"当前活动");
            self.tabBarController.selectedIndex=1;
            break;
        case 2:
            NSLog(@"搜索");
            self.tabBarController.selectedIndex=3;
            break;
        case 3:
            NSLog(@"日历");
            break;
        case 4:
        {
            NSLog(@"我的任务");
            break;
        }
        case 5:
            NSLog(@"工作区");
            break;
        case 6:
        {
            SettingViewController *settingViewController=[[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
            [self.navigationController pushViewController:settingViewController animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
