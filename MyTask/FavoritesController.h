//
//  FavoritesController.h
//  MyTask
//
//  Created by marcus wang on 12-2-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
@interface FavoritesController : UIViewController

=======
#import "FavoritesData.h"
@interface FavoritesController : UIViewController
{
    __weak IBOutlet UITableView *rootTableView;
    NSMutableDictionary *favoritesDictionary;
    
    FavoritesData *favoritesData;
}
>>>>>>> wangjun_MyTask
@end
