//
//  ADClusterAnnotation.m
//  AppLibrary
//
//  Created by Patrick Nollet on 01/07/11.
//  Copyright 2011 Applidium. All rights reserved.
//

#import "ADClusterAnnotation.h"
#import "TSClusterAnnotationView.h"


BOOL ADClusterCoordinate2DIsOffscreen(CLLocationCoordinate2D coord) {
    return (coord.latitude == kADCoordinate2DOffscreen.latitude && coord.longitude == kADCoordinate2DOffscreen.longitude);
}

@implementation ADClusterAnnotation

- (id)init {
    self = [super init];
    if (self) {
        _cluster = nil;
        self.coordinate = kADCoordinate2DOffscreen;
        _type = ADClusterAnnotationTypeUnknown;
        _shouldBeRemovedAfterAnimation = NO;
        _title = @"Title";
    }
    return self;
}

- (void)setCluster:(ADMapCluster *)cluster {
    [self willChangeValueForKey:@"title"];
    [self willChangeValueForKey:@"subtitle"];
    _cluster = cluster;
    [self didChangeValueForKey:@"subtitle"];
    [self didChangeValueForKey:@"title"];
}

- (NSString *)title {
    return self.cluster.title;
}

- (NSString *)subtitle {
    return self.cluster.subtitle;
}

- (void)reset {
    self.cluster = nil;
    self.coordinate = kADCoordinate2DOffscreen;
}

- (NSArray *)originalAnnotations {
    NSAssert(self.cluster != nil, @"This annotation should have a cluster assigned!");
    return self.cluster.originalAnnotations;
}

- (NSUInteger *)clusterCount {
    
    return _cluster.clusterCount;
}

@end
