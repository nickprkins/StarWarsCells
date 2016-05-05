//
//  Characters.m
//  StarWarsCells
//
//  Created by Nick Perkins on 5/4/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "Characters.h"

@implementation Characters

+ (Characters *)characterWithDictionary:(NSDictionary *)characterDict
{
    Characters *aCharacter = nil;
    if (characterDict)
    {
        aCharacter = [[Characters alloc] init];
        aCharacter.characterName = [characterDict objectForKey:@"name"];
        aCharacter.characterType = [characterDict objectForKey:@"type"];
        aCharacter.characterImage = [characterDict objectForKey:@"image"];
        aCharacter.characterDescription = [characterDict objectForKey:@"description"];
    }
    return aCharacter;
}

@end
