//
//  OSGlobals.m
//  TutorialApp
//
//  Created by KSMacbook on 17/01/17.
//  Copyright © 2017 KOCSISTEM. All rights reserved.
//

#import "OSGlobals.h"
#import "OSSectionModel.h"
#import "OSRowModel.h"

@implementation OSGlobals

+ (NSArray *)getMainTableViewArray{
    NSMutableArray *array = [NSMutableArray array];
    OSSectionModel *layoutSection = [OSSectionModel new];
    layoutSection.title = @"Auto Layout";
    
    OSRowModel *t1 = [OSRowModel new];
    t1.title = @"Tutorial 1";
    t1.viewControllerIdentifier = @"AutoLayoutTutorial1ViewControllerIdentifier";
    [layoutSection addRowModel:t1];
    
    OSRowModel *t2 = [OSRowModel new];
    t2.title = @"Tutorial 2";
    t2.viewControllerIdentifier = @"AutoLayoutTutorial2ViewControllerIdentifier";
    [layoutSection addRowModel:t2];
    
    OSRowModel *t3 = [OSRowModel new];
    t3.title = @"Tutorial 3";
    t3.viewControllerIdentifier = @"AutoLayoutTutorial3ViewControllerIdentifier";
    [layoutSection addRowModel:t3];
    
    [array addObject:layoutSection];
    
    OSSectionModel *componentSection = [OSSectionModel new];
    componentSection.title = @"Component";
    
    OSRowModel *s1 = [OSRowModel new];
    s1.title = @"UIScrollview";
    s1.viewControllerIdentifier = @"ScrollviewTutorial1ViewControllerIdentifier";
    [componentSection addRowModel:s1];

    [array addObject:componentSection];
    
    return array;
}

@end
