//
//  Page2ViewController.h
//  50hertz_app_clone_2nd_try
//
//  Created by Coeus on 10/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateViewController.h"

@interface Page2ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (nonatomic) NSInteger index;
@property (strong, nonatomic) NSArray * jsonObjs;


@end
