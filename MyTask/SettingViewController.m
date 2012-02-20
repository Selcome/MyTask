//
//  SettingViewController.m
//  MyTask
//
//  Created by marcus wang on 12-2-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SettingViewController.h"
#import "AboutController.h"
@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=@"设置";
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View     lifecycle

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
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
         [[NSNotificationCenter defaultCenter] postNotificationName:@"change.login.viewcontroller" object:nil];
    }
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *taskCellTitleId = @"FavoritesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:taskCellTitleId];
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:taskCellTitleId];
    }
    switch (indexPath.row) {
        case 0:
             cell.textLabel.text=@"关于";
            break;
        default:
             cell.textLabel.text=@"注销";
            break;
    }
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            //关于
        {
            AboutController *aboutController=[[AboutController alloc] initWithNibName:@"AboutController" bundle:nil];
            [self.navigationController pushViewController:aboutController animated:YES];
        }
            break;
            
        default:
        {
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"警告" message:@"是否注销?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
            [alertView show];
        }
            break;
    }
}
@end
