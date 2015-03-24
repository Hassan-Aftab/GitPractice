//
//  GetMappedData.h
//  app_50hertz_clone
//
//  Created by Coeus on 06/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonMainItem.h"

@protocol GetMappedDataDelegate <NSObject>

-(void)getMappedData:(NSArray*) mappedList;

@end

@interface GetMappedData : NSObject

@property (weak, nonatomic) id<GetMappedDataDelegate> delegate;

@property (strong, nonatomic) NSMutableArray * recievedDataMapped;
-(NSArray *)getData;

@end
