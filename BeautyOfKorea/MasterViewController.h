//
//  MasterViewController.h
//  BeautyOfKorea
//
//  Created by curos on 3/2/13.
//  Copyright (c) 2013 curos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterBkgrndCtlr ;
@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (weak,nonatomic) MasterBkgrndCtlr* parent ;
@property (strong, nonatomic) DetailViewController *detailViewController;

@end
