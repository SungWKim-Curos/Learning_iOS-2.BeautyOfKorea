//
//  LocationAnnotation.h
//  BeautyOfKorea
//
//  Created by curos on 3/5/13.
//  Copyright (c) 2013 curos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>



@interface LocationAnnotation : NSObject < MKAnnotation >

@property(nonatomic) CLLocationCoordinate2D coordinate ;
@property(nonatomic) NSString* title ;
@property(nonatomic) NSString* subtitle ;

@end
