//
//  MapCtlr.m
//  BeautyOfKorea
//
//  Created by curos on 3/5/13.
//  Copyright (c) 2013 curos. All rights reserved.
//

#import "MapCtlr.h"

// Relevant Headers
#import "LocationAnnotation.h"



static const CLLocationCoordinate2D LOC_COORD[] = {
    { 35.78995,  129.331838 },
    { 36.634187, 128.68585  },
    { 36.538778, 128.519547 },
    { 36.998963, 128.687453 },
    { 35.835089, 129.218992 },
};

static NSString* const TITLE[] = {
    @"불국사(佛國寺)", @"병산서원(屛山書院)", @"하회마을", @"부석사(浮石寺)", @"첨성대(瞻星臺)"
};

static NSString* const SUBTITLE[] = {
    @"Bulguksa Temple", @"Byungsan Seowon", @"Hahoe Village", @"Busoksa Temple", @"Cheomseongdae"
};



@interface MapCtlr ()
@property (weak, nonatomic) IBOutlet MKMapView *mapVw;
@end

@implementation MapCtlr

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
    
    for( int i=0 ; i<5 ; ++i )
    {
        LocationAnnotation* oLocAnnot = [ [LocationAnnotation alloc] init ] ;
        oLocAnnot.coordinate = LOC_COORD[i] ;
        oLocAnnot.title = TITLE[i] ;
        oLocAnnot.subtitle = SUBTITLE[i] ;
        [ _mapVw addAnnotation:oLocAnnot ] ;
    }
    
    MKCoordinateRegion reg ;
    reg.span.latitudeDelta = 1 ;
    reg.span.longitudeDelta = 1 ;
    reg.center = LOC_COORD[1] ;
    [ _mapVw setRegion:reg animated:FALSE ] ;
    [ _mapVw regionThatFits:reg ] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction) backDidTouch:(UIButton*)a_oSenderBtn
{
    [ self.navigationController popViewControllerAnimated:TRUE ] ;
}



-(IBAction) mapTypeDidChange:(UISegmentedControl*)a_oSegSender
{
    const static MKMapType MAP_TYPE[3] = { MKMapTypeStandard, MKMapTypeSatellite, MKMapTypeHybrid } ;
    
    _mapVw.mapType = MAP_TYPE[a_oSegSender.selectedSegmentIndex] ;
}


@end
