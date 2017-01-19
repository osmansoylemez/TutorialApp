//
//  ScrollviewItemViewController.h
//  TutorialApp
//
//  Created by KSMacbook on 18/01/17.
//  Copyright © 2017 KOCSISTEM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizModel.h"

@protocol ScrollviewItemViewControllerDelegate <NSObject>

- (void)updateQuizModel:(QuizModel *)quiz;

@end

@interface ScrollviewItemViewController : UIViewController

@property (nonatomic, assign) QuizModel *quiz;

@property (nonatomic) id<ScrollviewItemViewControllerDelegate> delegate;

@end
