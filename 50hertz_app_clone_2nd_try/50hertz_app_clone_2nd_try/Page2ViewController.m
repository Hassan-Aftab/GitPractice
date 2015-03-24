//
//  Page2ViewController.m
//  50hertz_app_clone_2nd_try
//
//  Created by Coeus on 10/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "Page2ViewController.h"


@interface Page2ViewController () {
    NSMutableArray *pages;
    //TemplateViewController *page;
}

@end

@implementation Page2ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage * im = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"menu_button@2x"  ofType:@"png" inDirectory:@"menu_button/"]];
    
    _homeButton.imageView.image = im;
    [self setupPages];
    
}

- (void)setupPages {
    
    pages = [NSMutableArray new];
    
    CGFloat xAxis = 0;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    for (NSUInteger i=0; i<self.jsonObjs.count; i++) {
        
        TemplateViewController *page = [[TemplateViewController alloc] init];
        page.item=self.jsonObjs[i];
        page.index = i;
        page.view.frame = CGRectMake(xAxis, 0, width, height);
        [self.mainScrollView addSubview:page.view];
        
        [pages addObject:page];
        
        xAxis+=width;
        
    }
    
    self.mainScrollView.contentOffset = CGPointMake(_index*width, 0);
    
    self.mainScrollView.contentSize = CGSizeMake(width*self.jsonObjs.count, height);
    
    
    
}


+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBackToList:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
