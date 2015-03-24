//
//  ViewController.h
//  50hertz_app_clone_2nd_try
//
//  Created by Coeus on 10/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonMainItem.h"
#import "GetMappedData.h"
#import "customCellMain.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray* completeData;

@end
