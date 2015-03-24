//
//  JsonMainItem.h
//  app_50hertz_clone
//
//  Created by Coeus on 06/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu1DictionaryItem.h"

@interface JsonMainItem : NSObject

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * image;
@property (strong, nonatomic) NSString * animation;
@property (strong, nonatomic) NSString * color_main_start;
@property (strong, nonatomic) NSString * color_main_end;
@property (strong, nonatomic) NSString * color_separator;

@property (strong, nonatomic) NSArray * menu;


@end
