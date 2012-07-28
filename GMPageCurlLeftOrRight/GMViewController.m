//
//  GMViewController.m
//  GMPageCurlLeftOrRight
//
//  Created by Leros ua on 12-7-28.
//  Copyright (c) 2012年 cyclone. All rights reserved.
//

#import "GMViewController.h"

@interface GMViewController ()

@end

@implementation GMViewController
@synthesize pageView = _pageView;
@synthesize containerView = _containerView;

- (UIView *) containerView {
    if(!_containerView){
        _containerView = [[UIView alloc] initWithFrame:self.pageView.bounds];
    _containerView.transform = CGAffineTransformMakeRotation(M_PI_2*3);

    }
    return _containerView;
}
- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc{
    self.pageView = nil;
    self.containerView = nil;
    [super dealloc];
}


#pragma mark -
- (IBAction)leftBtn:(id)sender{
    
    [self viewAnimationTransitionCurlRight:self.pageView toLeft:NO];

}
- (IBAction)rightBtn:(id)sender{

    [self viewAnimationTransitionCurlRight:self.pageView toLeft:YES];
}

- (void) viewAnimationTransitionCurlRight:(UIView *) view toLeft:(BOOL) left {
    UIView *parent = self.view;
    UIView * containerView = [[[UIView alloc] initWithFrame:view.bounds] autorelease];
   containerView.frame = view.bounds;
    containerView.transform = CGAffineTransformMakeRotation(M_PI_2*3);
    
    
    [parent addSubview:containerView];
    [containerView addSubview:view];
    view.transform = CGAffineTransformMakeRotation(-M_PI_2*3);
    
    [UIView beginAnimations:@"CurlLeftOrRightInView"  context:nil];
    [UIView setAnimationDuration:1.0f];
//    [UIView setAnimationDidStopSelector:@selector(viewCurlFinish:)];
//    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:left?UIViewAnimationTransitionCurlUp:UIViewAnimationTransitionCurlDown forView:view cache:NO];
    [UIView commitAnimations];
}

- (void) viewAnimationTransitionCurlRight2:(UIView *) view toLeft:(BOOL) left {
    UIView *parent = self.view;
    
    
    [parent addSubview:self.containerView];
    [self.containerView addSubview:view];
    view.transform = CGAffineTransformMakeRotation(-M_PI_2*3);

    
    [UIView beginAnimations:@"CurlLeftOrRightInView"  context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDidStopSelector:@selector(viewCurlFinish:)];
    [UIView setAnimationDelegate:self];
    
	
    
    [UIView setAnimationTransition:left?UIViewAnimationTransitionCurlUp:UIViewAnimationTransitionCurlDown forView:view cache:NO];
    [UIView commitAnimations];
}

-(void) viewCurlFinish:(id)sender {

//    [self.containerView removeFromSuperview];
//    self.containerView = nil;
//    [self.view addSubview:self.pageView];
//    self.pageView.transform = CGAffineTransformMakeRotation(M_PI_2*3);

}

@end
