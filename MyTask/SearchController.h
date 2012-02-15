//
//  SearchController.h
//  MyTask
//
//  Created by marcus wang on 12-2-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchController : UIViewController<UISearchBarDelegate>
{
   __weak IBOutlet UISearchDisplayController *searchDisplayController;  
}
@end
