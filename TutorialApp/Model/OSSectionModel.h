//
//  OSSectionModel.h
//  TutorialApp
//
//  Created by KSMacbook on 17/01/17.
//  Copyright © 2017 KOCSISTEM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSRowModel.h"

@interface OSSectionModel : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSMutableArray *rowArray;

- (void)addRowModel:(OSRowModel *)rowModel;

@end
