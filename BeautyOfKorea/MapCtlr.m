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
#import "DetailViewController.h"



static const CLLocationCoordinate2D LOC_COORD[] = {
    { 36.634187, 128.68585  },
    { 35.78995,  129.331838 },
    { 36.998963, 128.687453 },
    { 35.835089, 129.218992 },
    { 36.538778, 128.519547 },
};

static NSString* const TITLE[] = {
    @"병산서원(屛山書院)", @"불국사(佛國寺)", @"부석사(浮石寺)", @"첨성대(瞻星臺)", @"하회마을"
};

static NSString* const SUBTITLE[] = {
    @"Byungsan Seowon", @"Bulguksa Temple", @"Busoksa Temple", @"Cheomseongdae", @"Hahoe Village"
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
    reg.center = LOC_COORD[0] ;
    [ _mapVw setRegion:reg animated:FALSE ] ;
    [ _mapVw regionThatFits:reg ] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(MKAnnotationView*) mapView:(MKMapView*)a_oMapVw viewForAnnotation:(id<MKAnnotation>)a_oAnnotation
{
    UIButton* oBtn = [ UIButton buttonWithType:UIButtonTypeDetailDisclosure ] ;
    oBtn.frame = CGRectMake( 0, 0, 23, 23 ) ;
    oBtn.contentVerticalAlignment   = UIControlContentVerticalAlignmentCenter ;
    oBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter ;
    
    MKAnnotationView* oVw = [ [MKAnnotationView alloc] initWithAnnotation:a_oAnnotation reuseIdentifier:@"MyAnnotVw" ] ;
    oVw.rightCalloutAccessoryView = oBtn ;
    oVw.canShowCallout = YES ;
    oVw.image = [ UIImage imageNamed:@"annotationIcon" ] ;    
    return oVw ;
}



-(void) mapView:(MKMapView*)a_oMapVw annotationView:(MKAnnotationView*)a_oAnnotVw calloutAccessoryControlTapped:(UIControl*)a_oCtl
{
    NSString* oTitle = a_oAnnotVw.annotation.title ;
    int iMenu = 0 ;
    for( ; iMenu<5 ; ++iMenu )
    {
        if( [ oTitle compare:TITLE[iMenu] ] == NSOrderedSame  )
            break ;
    }
    if( iMenu >= 5 )
        return ;
    
    DetailViewController* oVwCtlr = [ [DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil ] ;
    oVwCtlr->m_iMenu = iMenu ;
    [ super.navigationController pushViewController:oVwCtlr animated:YES ] ;
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
