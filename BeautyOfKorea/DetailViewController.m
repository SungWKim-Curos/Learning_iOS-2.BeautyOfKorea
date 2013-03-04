//
//  DetailViewController.m
//  BeautyOfKorea
//
//  Created by curos on 3/2/13.
//  Copyright (c) 2013 curos. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollVw;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end



static NSString* const IMAGE_NAMES[] =
{
    @"introByungSan",
    @"introBulguksa",
    @"introBusoksa",
    @"introChumsongdae",
    @"introAndong"
};



@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



-(void)viewWillAppear:(BOOL)a_animated
{
    [ super viewWillAppear:a_animated ] ;
    
    if( 0<=m_iMenu && m_iMenu<5 )
    {
        UIImage* oImg = [ UIImage imageNamed:IMAGE_NAMES[m_iMenu] ] ;
        const CGSize size = oImg.size ;
        _imageView.frame = CGRectMake( 0, 0, size.width, size.height ) ;
        _imageView.image = oImg ;
        _contentScrollVw.contentSize = size ;
        _contentScrollVw.contentOffset = CGPointMake(0,0) ;
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}



- (IBAction)BackDidTouch:(id)sender
{
    [ self.navigationController popToRootViewControllerAnimated:YES] ;
}

@end
