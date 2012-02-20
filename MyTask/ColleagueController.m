//
//  ColleagueController.m
//  MyTask
//
//  Created by marcus wang on 12-2-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ColleagueController.h"
#import "ColleagueTableViewCell.h"
#import "OperationalDatabase.h"
@implementation ColleagueController

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.navigationItem.title=@"同事";
        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onClickEditButton:)];
        self.navigationItem.rightBarButtonItem=anotherButton;
        colleagueArray=[[OperationalDatabase defaultManager] getColleagueArray];
    }
    return self;
}
-(void)onClickEditButton:(id)sender
{
    [rootTableView setEditing:YES];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(onClickSaveButton:)];
    self.navigationItem.rightBarButtonItem=anotherButton;
}
-(void)onClickSaveButton:(id)sender
{
    [rootTableView setEditing:NO];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onClickEditButton:)];
    self.navigationItem.rightBarButtonItem=anotherButton;
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
#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [colleagueArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *taskCellTitleId = @"ColleagueTableViewCell";
    ColleagueTableViewCell *cell = (ColleagueTableViewCell *)[tableView dequeueReusableCellWithIdentifier:taskCellTitleId];
    if(cell==nil){
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ColleagueTableViewCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
    }
    [cell onShowCell:[colleagueArray objectAtIndex:[indexPath row]]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
    return UITableViewCellEditingStyleNone; 
} 
-(BOOL)tableView:(UITableView *) tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    //打开编辑
    return YES;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    //允许移动
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //交换数据
    
}
@end
