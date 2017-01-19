//
//  ScrollviewItemViewController.m
//  TutorialApp
//
//  Created by KSMacbook on 18/01/17.
//  Copyright © 2017 KOCSISTEM. All rights reserved.
//

#import "ScrollviewItemViewController.h"

@interface ScrollviewItemViewController ()

@end

@implementation ScrollviewItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
}

#pragma mark Action

- (IBAction)buttonTouchUpInside:(id)sender {
    NSLog(@"buttonTouchUpInside");
    if ([self.delegate respondsToSelector:@selector(updateQuizModel:)]) {
        [self.delegate updateQuizModel:_quiz];
    }
}

@end
