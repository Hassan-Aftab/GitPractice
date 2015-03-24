//
//  ViewController.m
//  50hertz_app_clone_2nd_try
//
//  Created by Coeus on 10/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "ViewController.h"
#import "Page2ViewController.h"

@interface ViewController () <GetMappedDataDelegate>

@end

@implementation ViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Page2ViewController * next = segue.destinationViewController;
    NSIndexPath * p = sender;
    
    next.jsonObjs = _completeData;
    next.index = p.row;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _completeData.count;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    customCellMain * cell= [tableView dequeueReusableCellWithIdentifier:@"mainTableViewCell"];
    
    JsonMainItem * item = _completeData[indexPath.row];
    
    cell.backgroundColor = [[self class] colorFromHexString:item.color_main_start];
    cell.lblText.text = item.title;
    
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    
    
    NSString * path = [resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@", @"overview_graphics/",item.image]];
    
    UIImage * image = [UIImage imageWithContentsOfFile:path];
    cell.backgroundImage.image = image;
    
    return cell;
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self performSegueWithIdentifier:@"ontoDetailView" sender:indexPath];
    
    return;
       
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    GetMappedData * data = [GetMappedData new];
    
    data.delegate = self;
    _completeData = [data getData];
}

-(void)getMappedData:(NSArray *)mappedList{
    
    NSLog(@"%@", mappedList);
    _completeData = mappedList;
    
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}

@end
