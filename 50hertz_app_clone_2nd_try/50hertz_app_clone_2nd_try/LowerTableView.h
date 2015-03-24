//
//  LowerTableView.h
//  app_50hertz_clone
//
//  Created by Coeus on 09/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonMainItem.h"
#import "ViewController.h"

@interface LowerTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray * items;
@property (strong, nonatomic) JsonMainItem * item;
@property (strong, nonatomic) ViewController * vc;


- (id)initWithFrame:(CGRect)frame menuItems:(JsonMainItem*)itms;


@end
