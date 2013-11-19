//
//  Item.h
//  Adventure
//
//  Created by Justin Heideman on 11/12/13.
//  Copyright (c) 2013 Livefront. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

// name of the item
@property (nonatomic, strong) NSString *name;

#pragma mark - Instance methods

/// Creates a new instance of the class with the specified name.
///
/// @param name
///     The name of the new item.
///
- (id)initWithName:(NSString *)name;

/// When the item is used, the action is what happens.
///
- (NSString*)itemAction;


@end


