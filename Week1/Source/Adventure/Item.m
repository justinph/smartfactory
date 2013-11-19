//
//  Item.m
//  Adventure
//
//  Created by Justin Heideman on 11/12/13.
//  Copyright (c) 2013 Livefront. All rights reserved.
//

#import "Item.h"

@implementation Item

- (id)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self)
    {
        _name = name;
    }
    
    return self;
}

- (NSString *)itemAction
{
    return [NSString stringWithFormat:@"You use the %@. Nothing happens.", self.name];
}

@end
