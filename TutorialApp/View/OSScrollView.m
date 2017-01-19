//
//  OSScrollView.m
//  TutorialApp
//
//  Created by KSMacbook on 18/01/17.
//  Copyright © 2017 KOCSISTEM. All rights reserved.
//

#import "OSScrollView.h"

@implementation OSScrollView

- (void)setScrollEnabled:(BOOL)scrollEnabled{
    [super setScrollEnabled:scrollEnabled];
    NSLog(@"setScrollEnabled:%@",scrollEnabled ? @"TRUE" : @"FALSE");
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled{
    [super setUserInteractionEnabled:userInteractionEnabled];
    NSLog(@"setUserInteractionEnabled:%@",userInteractionEnabled ? @"TRUE" : @"FALSE");
}

@end
