//
//  TaskController.m
//  MyTask
//
//  Created by Marshal Wu on 12-2-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskController.h"
#import "TaskDetailTableView.h"
#import "DataManager.h"

@interface TaskController ()
-(void)setCurrentView:(UIView *) theView;
@end

@implementation TaskController{
    __weak UIView *currentSubView;
    NSDictionary *activity;
}

-(void)setCurrentView:(UIView *) theView{
    currentSubView=theView;
    [subViewContainer addSubview:theView];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil id:(NSString *) theId
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        activity=[[DataManager shareInstance] getActivity:theId];
        self.navigationItem.title=[activity objectForKey:@"title"];
    }
    return self;
}

- (IBAction)switchSubView:(id)sender {
    UISegmentedControl *segment=(UISegmentedControl *)sender;
    switch ([segment selectedSegmentIndex]) {
        case 0:
            if(currentSubView!=taskDetailView){
                [currentSubView removeFromSuperview];
                [self setCurrentView:taskDetailView];
            }
            break;
        case 1:
            if(currentSubView!=commentView){
                [currentSubView removeFromSuperview];
                [self setCurrentView:commentView];
            }
            break;
        case 2:
            if(currentSubView!=childTaskView){
                [currentSubView removeFromSuperview];
                [self setCurrentView:childTaskView];
            }
            break;
        default:
            break;
    }
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
    
    taskDetailView.activity=activity;
    
    [self setCurrentView:taskDetailView];
    
}

- (void)viewDidUnload
{
    subViewContainer = nil;
    taskDetailView = nil;
    commentView = nil;
    childTaskView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)onClickSubmitButton:(id)sender
{
     [self.navigationController popViewControllerAnimated:YES];
}
@end
