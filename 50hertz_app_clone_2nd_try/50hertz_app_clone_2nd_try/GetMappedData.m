//
//  GetMappedData.m
//  app_50hertz_clone
//
//  Created by Coeus on 06/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "GetMappedData.h"

@implementation GetMappedData

-(NSArray *)getData
{
    
    NSURL * url = [NSURL URLWithString:@"http://app.50hertz.3pc-web.de/menu.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    
    _recievedDataMapped = [NSMutableArray new];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSArray *recievedData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        for (NSDictionary * dicElement in recievedData) {
            JsonMainItem * mainItem = [JsonMainItem new];
            
            [mainItem setTitle:dicElement[@"title"]];
            [mainItem setImage:dicElement[@"image"]];
            [mainItem setAnimation:dicElement[@"animation"]];
            
            [mainItem setColor_main_start:dicElement[@"color_main_start"]];
            [mainItem setColor_main_end:dicElement[@"color_main_end"]];
            [mainItem setColor_separator:dicElement[@"color_separator"]];
            
            NSArray * menu1 = dicElement[@"menu_1"];
            NSMutableArray * menu1array = [NSMutableArray new];
            
            
            for (NSDictionary * innerDictElement in menu1) {
                Menu1DictionaryItem * menu1Item = [Menu1DictionaryItem new];
                [menu1Item setTitle:innerDictElement[@"title"]];
                
                NSArray * menu2Array = innerDictElement[@"menu_2"];
                NSMutableArray * array = [NSMutableArray new];
                
                for (NSDictionary *menu2DictElement in menu2Array) {
                    Menu2DictionaryItem * menu2Item = [Menu2DictionaryItem new];
                    [menu2Item setTitle:menu2DictElement[@"title"]];
                    [menu2Item setVersion:menu2DictElement[@"version"]];
                    [menu2Item setFile:menu2DictElement[@"file"]];
                    [array addObject:menu2Item];
                }
                menu1Item.menu2 = array.copy;
                [menu1array addObject:menu1Item];
            }
            mainItem.menu = menu1array.copy;
            
            [_recievedDataMapped addObject:mainItem];
            
        }
        
        if ([self.delegate respondsToSelector:@selector(getMappedData:)]) {
            [self.delegate getMappedData:_recievedDataMapped];
        }
            // NSLog(@"%f",_recievedDataMapped.count);
        
    }];
    
    
    return _recievedDataMapped.copy;
}

@end
