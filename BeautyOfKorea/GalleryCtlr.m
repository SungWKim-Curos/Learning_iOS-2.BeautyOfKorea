//
//  GalleryCtlr.m
//  BeautyOfKorea
//
//  Created by curos on 3/5/13.
//  Copyright (c) 2013 curos. All rights reserved.
//

#import "GalleryCtlr.h"

@interface GalleryCtlr ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@end



const int iGALLERY_PHOTOS = 20 ;
const float fSCROLL_WIDTH = 310.0 ;
const float fSCROLL_HEIGHT = 466.0 ;



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
    
    float fXPos = 0.0 ;
    
    for( int i=1 ; i<=iGALLERY_PHOTOS ; ++i )
    {
        NSString* oName = [ NSString stringWithFormat:@"photos_%d_%02d.JPG", m_iMenu+1, i ] ;
        UIImage* oImg = [ UIImage imageNamed:oName ] ;
        UIImageView* oImgVw = [ [UIImageView alloc] initWithImage:oImg ] ;
        oImgVw.frame = CGRectMake( fXPos, 0, fSCROLL_WIDTH, fSCROLL_HEIGHT ) ;
        [ _contentView addSubview:oImgVw ] ;
        fXPos += fSCROLL_WIDTH ;        
    }
    
    _contentView.contentSize = CGSizeMake( fXPos, fSCROLL_HEIGHT ) ;
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
