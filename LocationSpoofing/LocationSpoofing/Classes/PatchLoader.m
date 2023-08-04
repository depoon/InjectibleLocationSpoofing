//
//  PatchLoader.m
//  LocationSpoofing
//
//  Created by Kenneth Poon on 28/11/16.
//  Copyright © 2016 Kenneth Poon. All rights reserved.
//

#import "PatchLoader.h"
#import "LocationSpoofing-Swift.h"

@implementation PatchLoader

static void __attribute__((constructor)) initialize(void) {
    NSLog(@"==== Code Injection in Action====");

    [LocationSwizzler turnOnSwizzleForCoordinate];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        static PatchUIManager *patchUIManager;
        patchUIManager = [[PatchUIManager alloc] init];
        [patchUIManager hijackAppWindow];
    });

}

@end

