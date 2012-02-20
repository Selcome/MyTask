//
//  AboutController.m
//  MyTask
//
//  Created by marcus wang on 12-2-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AboutController.h"
#import "HttpRequest.h"
#define jsonUrl @"http://marcuswang.github.com/MyTaskServer/about.json"
@implementation AboutController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=@"关于";
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
    HttpRequest *httpRequest=[[HttpRequest alloc] init];
    NSError *error;
    NSDictionary *dir=[NSJSONSerialization JSONObjectWithData:[httpRequest getGETRequest:jsonUrl] options:kNilOptions error:&error];
    textView.text=[dir objectForKey:@"about"];
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

@end
