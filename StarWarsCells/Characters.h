//
//  Characters.h
//  StarWarsCells
//
//  Created by Nick Perkins on 5/4/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Characters : NSObject

@property (nonatomic) NSString *characterName;
@property (nonatomic) NSString *characterImage;
@property (nonatomic) NSString *characterType;
@property (nonatomic) NSString *characterDescription;

+ (Characters *)characterWithDictionary:(NSDictionary *)characterDict;

@end
