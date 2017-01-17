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
    
    [array addObject:layoutSection];
    
    return array;
}

@end
