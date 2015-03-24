//
//  TemplateViewController.h
//  50hertz_app_clone_2nd_try
//
//  Created by Coeus on 11/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateViewController.h"
#import "JsonMainItem.h"

@interface TemplateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) JsonMainItem * item;
@property NSUInteger index;


@end
