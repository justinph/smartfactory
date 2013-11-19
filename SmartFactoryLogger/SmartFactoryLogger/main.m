//
//  main.m
//  SmartFactoryLogger
//
//  Created by Justin Heideman on 11/12/13.
//  Copyright (c) 2013 SmartFactory. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"I ate %d cookies.", 10);
        NSLog(@"I ate %f pies.", 3.14529);
        //NSLog(@"jesus is my homeboy %C", '\\u0012' );
        
        //allocate memory for a new array, then call the init message
        // you almost always call alloc with init
        // the asterisk is for the pointer -- you have use pointers with objects
        // NSArray is immutable - this
        NSArray *anArray = [[NSArray alloc] init];
        
        // this is a factory -- same as calling alloc and init together, this is because NSArray has a specal method to do alloc and init together -- not every object does
        NSArray *aDiffArray = [NSArray array];
        
        //create a NS string
        NSString *emptyString = [[NSString alloc] init];
        
        // shortcut for creating NSString
        //NSString *anotherEmptyString = @"";
        
        
        // EXAMPLE 3
        //create some cheeses
        NSString *camembert = @"Camembert";
        NSString *gouda = @"Gouda";
        NSString *cheddar = @"Cheddar";
        NSString *goat;
        
        // the long way, but it deals with nil objects better
        NSArray *cheeses = [[NSArray alloc] initWithObjects:camembert, gouda, cheddar, goat, nil];
        
        // the short way, doesn't deal with nil objects well at all
        //NSArray *cheeses = @[camembert, gouda, cheddar, goat];
        
        for (NSString *string in cheeses) {
            NSLog(@"i am eating %@", string);
        }
        
        
        // the long way
//        NSDictionary *stateCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
//                                       @"Saint Paul", @"Minnesota",
//                                       @"Des Moines", @"Iowa",
//                                       @"Madison", @"Wisconsin", nil];
        NSDictionary *stateCapitals = @{
                                        @"Minnesota": @"Saint Paul",
                                        @"Iowa": @"Des Moines",
                                        @"Wisconsin": @"Madison", 
                                        };
        
        
        for (NSString *state in stateCapitals)
        {
            NSLog(@"The capital of %@ is %@", state, [stateCapitals objectForKey:state]);
        }
         
        
        
    }
    return 0;
}

