//
//  GalleryCtlr.m
//  BeautyOfKorea
//
//  Created by curos on 3/5/13.
//  Copyright (c) 2013 curos. All rights reserved.
//

#import "GalleryCtlr.h"

@interface GalleryCtlr ()

@end

@implementation GalleryCtlr

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction) backDidTouch:(UIButton*)a_oSender
{
    [ super.navigationController popViewControllerAnimated:YES ] ;
}


@end
