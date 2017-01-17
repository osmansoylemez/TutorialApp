//
//  OSSectionModel.m
//  TutorialApp
//
//  Created by KSMacbook on 17/01/17.
//  Copyright © 2017 KOCSISTEM. All rights reserved.
//

#import "OSSectionModel.h"

@implementation OSSectionModel

- (void)addRowModel:(OSRowModel *)rowModel{
    if (!_rowArray) {
        _rowArray = [NSMutableArray array];
    }
    
    [_rowArray addObject:rowModel];
}

@end
