//
//  ScrollviewTutorial1ViewController.m
//  TutorialApp
//
//  Created by KSMacbook on 18/01/17.
//  Copyright © 2017 KOCSISTEM. All rights reserved.
//

#import "ScrollviewTutorial1ViewController.h"
#import "ScrollviewItemViewController.h"
#import "QuizModel.h"
#import "OSScrollView.h"

@interface ScrollviewTutorial1ViewController ()<UIScrollViewDelegate,ScrollviewItemViewControllerDelegate>

@property (weak, nonatomic) IBOutlet OSScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *quizArray;

@property (nonatomic) CGPoint initializeScrollviewPoint;
@property (nonatomic) int currentPage;

@end

@implementation ScrollviewTutorial1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initScrollView];
}

- (void)initScrollView{
    
    _quizArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        QuizModel *quizModel = [QuizModel new];
        if (i == 3 || i == 6) {
            quizModel.jumpNextPage = NO;
        }else{
            quizModel.jumpNextPage = YES;
        }
        [_quizArray addObject:quizModel];
    }
    
    
    for (int i = 0; i < _quizArray.count; i++) {
        ScrollviewItemViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ScrollviewItemViewControllerIdentifier"];
        controller.quiz = [_quizArray objectAtIndex:i];
        controller.delegate = self;
        [self addChildViewController:controller];
        
        CGRect rect = self.scrollView.frame;
        rect.origin.x = CGRectGetWidth([UIScreen mainScreen].bounds) * i;
        //rect.size.width = CGRectGetWidth([UIScreen mainScreen].bounds);
        controller.view.frame = rect;
        [self.scrollView addSubview:controller.view];
        
        [controller didMoveToParentViewController:self];
    }
    
    [self.scrollView setContentSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) * 10, CGRectGetHeight(self.scrollView.frame))];
}

#pragma mark ScrollviewItemViewControllerDelegate

- (void)updateQuizModel:(QuizModel *)quiz{
    quiz.jumpNextPage = YES;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
    
    float point = scrollView.contentOffset.x - _initializeScrollviewPoint.x;
    if (point > 0) {
        NSLog(@"next page");
        QuizModel *quizModel = [_quizArray objectAtIndex:_currentPage];
        if (!quizModel.jumpNextPage) {
            scrollView.userInteractionEnabled = NO;
            scrollView.scrollEnabled = NO;
            [scrollView setContentOffset:CGPointMake(_currentPage * CGRectGetWidth([UIScreen mainScreen].bounds), 0)];
            scrollView.userInteractionEnabled = YES;
            scrollView.scrollEnabled = YES;
        }
        
        
    }else if(point < 0){
        NSLog(@"previous page");
    }else{
        NSLog(@"same page");
        scrollView.userInteractionEnabled = YES;
        scrollView.scrollEnabled = YES;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
    
    _initializeScrollviewPoint = scrollView.contentOffset;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"scrollViewWillEndDragging contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
    scrollView.userInteractionEnabled = NO;
    scrollView.scrollEnabled = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
    scrollView.userInteractionEnabled = YES;
    scrollView.scrollEnabled = YES;
    CGFloat pageWidth = self.scrollView.bounds.size.width;
    _currentPage = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndScrollingAnimation contentOffset %@",NSStringFromCGPoint(scrollView.contentOffset));
}

/*
 - (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
 
 }
 
 - (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
 
 }
 
 */
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
}

@end
