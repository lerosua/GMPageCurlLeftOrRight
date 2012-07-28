//
//  GMViewController.h
//  GMPageCurlLeftOrRight
//
//  Created by Leros ua on 12-7-28.
//  Copyright (c) 2012年 cyclone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMViewController : UIViewController

@property (nonatomic,retain) IBOutlet UIView *pageView;
@property (nonatomic,retain) UIView *containerView;
- (IBAction)leftBtn:(id)sender;
- (IBAction)rightBtn:(id)sender;

@end
