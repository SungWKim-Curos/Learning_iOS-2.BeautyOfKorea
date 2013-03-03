//
//  MasterBkgrndCtlr.m
//  BeautyOfKorea
//
//  Created by curos on 3/3/13.
//  Copyright (c) 2013 curos. All rights reserved.
//

#import "MasterBkgrndCtlr.h"

#import "MasterViewController.h"



@interface MasterBkgrndCtlr ()

@property (strong, nonatomic) IBOutlet MasterViewController *tblVwCtlr;

@end

@implementation MasterBkgrndCtlr

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UITableView* oTblVw = _tblVwCtlr.tableView ;
    [ self.view addSubview:oTblVw ] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
