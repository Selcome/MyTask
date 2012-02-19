//
//  FavoritesController.m
//  MyTask
//
//  Created by marcus wang on 12-2-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FavoritesController.h"
#import "FavoritesData.h"
#import "AddFavoritesController.h"
@implementation FavoritesController
- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.navigationItem.title=@"收藏";
        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onClickAddButton:)];
        self.navigationItem.rightBarButtonItem=anotherButton;
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
   
}
-(void)onClickAddButton:(UIBarButtonItem *)barButtonItem
{
    AddFavoritesController *addFavoritesController=[[AddFavoritesController alloc] initWithNibName:@"AddFavoritesController" bundle:nil];
    [addFavoritesController setFavoritesData:favoritesData];
    [self.navigationController pushViewController:addFavoritesController animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    favoritesDictionary=[favoritesData getFavoritesDir];
    [rootTableView reloadData];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[favoritesDictionary allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key=[[favoritesDictionary allKeys] objectAtIndex:section];
    return [[favoritesDictionary objectForKey:key] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *taskCellTitleId = @"FavoritesCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:taskCellTitleId];
        if(cell==nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:taskCellTitleId];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
    NSString *key=[[favoritesDictionary allKeys] objectAtIndex:indexPath.section];
    NSArray *array=[favoritesDictionary objectForKey:key];
    cell.textLabel.text=[[array objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text=[[array objectAtIndex:indexPath.row] objectForKey:@"sex"];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key=[[favoritesDictionary allKeys] objectAtIndex:section];
	return key;
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView 
{
    NSMutableArray *toBeReturned = [NSMutableArray array];
    for(char c = 'A';c<='Z';c++)
        [toBeReturned addObject:[NSString stringWithFormat:@"%c",c]];
    return toBeReturned;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
    NSString *key=[[favoritesDictionary allKeys] objectAtIndex:indexPath.section];
    NSArray *array=[favoritesDictionary objectForKey:key];
    [favoritesData deleteFavorites:[array objectAtIndex:indexPath.row]];
    favoritesDictionary=[favoritesData getFavoritesDir];
    [rootTableView reloadData];
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
    return UITableViewCellEditingStyleDelete; 
} 
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
	return  @"删除"; 
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
    return YES; 
} 
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath { 
    return YES; 
} 
@end
