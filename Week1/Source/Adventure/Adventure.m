#import "Adventure.h"
#import "Room.h"
#import "Item.h"


@interface Adventure()

/// All the rooms in the adventure
///
@property (nonatomic, strong) NSSet *rooms;

/// The current room.
///
@property (nonatomic, strong) Room *currentRoom;

//- (RoomDirection)directionForString:(NSString *)directionString;

@end

@implementation Adventure

- (id)init
{
    self = [super init];
    
    if (self)
    {
        
        
        // create some items
        Item *shiv = [[Item alloc] initWithName:@"bloody shiv"];
        Item *bottle = [[Item alloc]initWithName:@"broken bottle"];
        Item *nail = [[Item alloc]initWithName:@"rusty nails"];
        Item *chain = [[Item alloc]initWithName:@"greasy chain"];
        
        //   ________________________
        //  |            |           |
        //  |   Office       Parts   |
        //  |____________|____  _____|
        //  |            |           |
        //  |  Workshop  |  Assembly |
        //  |____   _________________|
        //  |                        |
        //  |         Garage         |
        //  |                        |
        //   ------------------------
        //
        
        Room *office = [[Room alloc] initWithName:@"Office"];
        [office addItem:shiv];
        [office addItem:bottle];

        
        Room *partsRoom = [[Room alloc] initWithName:@"Parts room"];
        [partsRoom setWestEntranceTo:office];
        
        Room *assemblyRoom = [[Room alloc] initWithName:@"Assembly room"];
        [assemblyRoom setNorthEntranceTo:partsRoom];
        
        Room *workshop = [[Room alloc] initWithName:@"Workshop"];
        [workshop setEastEntranceTo:assemblyRoom];
        
        
        Room *garage = [[Room alloc] initWithName: @"Garage"];
        [garage setNorthEntranceTo:workshop];
        
        

        
 
        
        //put items in room
        
        
        
        self.rooms = [NSSet setWithObjects:office, partsRoom, assemblyRoom, workshop, nil];
        
        // Start out in the office
        self.currentRoom = office;
        
        
//        //NSString *myAction = [shiv itemAction];
//        //NSLog(@"%@", myAction);
        
        
    }
    
    return self;
}

- (NSString *)responseForInput:(NSString *)input
{
    NSArray *components = [input componentsSeparatedByString:@" "];
    
    if ([[components firstObject] isEqualToString:@"walk"])
    {
        if (components.count > 1)
        {
            NSString *normalizedDirection = [[components[1] lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            RoomDirection walkingDirection = [Room directionForString:normalizedDirection];
            
            Room *room  = [self.currentRoom roomForDirection:walkingDirection];

            if (room)
            {
                self.currentRoom = room;
                return [self.currentRoom description];
            }
            else
            {
                return @"You can't go that way.";
            }
        }
    } else if ([[components firstObject] isEqualToString:@"look"]){
        
        NSLog(@"%@", self.currentRoom);
        
        //Room *room  = [self.currentRoom roomForDirection:walkingDirection];
        
        return [self.currentRoom availableItems];
        //return @"Things might be here, but you need to put your glasses on first.";
        
    }
    
    return @"You appear to be mumbling.";
}

@end
