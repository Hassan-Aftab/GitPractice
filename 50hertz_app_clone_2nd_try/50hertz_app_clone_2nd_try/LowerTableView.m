//
//  LowerTableView.m
//  app_50hertz_clone
//
//  Created by Coeus on 09/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "LowerTableView.h"

@implementation LowerTableView


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 5)];
    
    cell.textLabel.font = [ UIFont fontWithName: @"Arial" size: 14.0 ];
    Menu1DictionaryItem * dict = _items[indexPath.section];
    
    NSArray *sectionAnimals = dict.menu2;
    Menu2DictionaryItem *item = [sectionAnimals objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [[self class]colorFromHexString:_item.color_main_start];
    UIImage * arrow = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"arrow_list_right" ofType:@"png"]];
    
    cell.accessoryView = [[UIImageView alloc]initWithImage:arrow];
    //cell.imageView.image = arrow;
    cell.imageView.center = CGPointMake(self.frame.size.width - 60, cell.frame.size.height/2);
    
    return cell;
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
     unsigned rgbValue = 0;
     NSScanner *scanner = [NSScanner scannerWithString:hexString];
     [scanner setScanLocation:1]; // bypass '#' character
     [scanner scanHexInt:&rgbValue];
     return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
                            
                            
                            
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 35.0f;

}

- (id)initWithFrame:(CGRect)frame menuItems:(JsonMainItem*)itm
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _items = itm.menu;
        _item = itm;
        
        
        self.delegate = self;
        self.dataSource = self;
        
        [self reloadData];
       
    }
    return self;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
    
    Menu2DictionaryItem * i= _items[section];
    
    [lbl setText:i.title];
    [lbl setFont:[ UIFont fontWithName: @"Arial" size: 12.0 ]];
    lbl.textColor = [UIColor whiteColor];
    
    [headerView addSubview:lbl];
    [headerView setBackgroundColor:[[self class] colorFromHexString:_item.color_separator]];
    
    return headerView;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _items.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Menu1DictionaryItem * d = _items[section];
    
    return d.title;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Menu1DictionaryItem * d = _items[section];
    
    return d.menu2.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    
//    _vc.mainScrollView.contentSize = CGSizeMake(tableView.frame.size.width + _vc.tableSize.width, _vc.mainScrollView.contentSize.height+_vc.tableSize.height);
//    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(_vc.mainScrollView.frame.size.width+270, 200, 100,100)];
//    
//    _vc.mainScrollView.contentOffset = CGPointMake(_vc.mainScrollView.frame.size.width+138, 0);
//    Menu1DictionaryItem * it= _item.menu[indexPath.row];
//    Menu2DictionaryItem * i = it.menu2[indexPath.row];
//    [lbl setText:i.file];
//    [_vc.mainScrollView addSubview:lbl];
//    
    
}


@end
