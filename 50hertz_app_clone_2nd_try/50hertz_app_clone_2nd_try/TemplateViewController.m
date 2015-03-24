//
//  TemplateViewController.m
//  50hertz_app_clone_2nd_try
//
//  Created by Coeus on 11/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "TemplateViewController.h"

@interface TemplateViewController ()

@end

@implementation TemplateViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _item.menu.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Menu1DictionaryItem * d = _item.menu[section];
    return d.menu2.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

//-(UITableViewCell*) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JsonMainItem * mainItem = _item;
    
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [ UIFont fontWithName: @"Arial" size:14.0];
    }
    
    NSArray *section = mainItem.menu;
    Menu1DictionaryItem *itm = [section objectAtIndex:indexPath.section];
    Menu2DictionaryItem *item = itm.menu2[indexPath.row];
    cell.textLabel.text = item.title;
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [[self class]colorFromHexString:mainItem.color_main_start];
    UIImage * arrow = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"arrow_list_right" ofType:@"png"]];
    
    cell.accessoryView = [[UIImageView alloc]initWithImage:arrow];
    
    return cell;
}







- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    
    JsonMainItem * itm = _item;
    
    Menu2DictionaryItem * i= itm.menu[section];
    
    [lbl setText:i.title];
    [lbl setFont:[ UIFont fontWithName: @"Arial" size: 12.0 ]];
    lbl.textColor = [UIColor whiteColor];
    
    [headerView addSubview:lbl];
    [headerView setBackgroundColor:[[self class] colorFromHexString:itm.color_separator]];
    
    return headerView;
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Menu1DictionaryItem * d = _item.menu[section];
    
    return d.title;
}

#pragma mark - Hex Color

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

#pragma mark - Setter

- (void)setItem:(JsonMainItem *)item {
    
    _item = nil;
    _item = item;
}

#pragma mark - ViewController Lifecycle


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [[self class] colorFromHexString:_item.color_main_start];
    self.lblTitle.text = _item.title;
    UIImage * im = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource: [_item.image componentsSeparatedByString:@"."][0]  ofType:@"png" inDirectory:@"category_graphics/"]];
    self.imgCategory.image = im;
    self.tableView.backgroundColor = [[self class] colorFromHexString:_item.color_main_start];
    
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
