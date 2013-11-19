#import "Room.h"
#import "Item.h"

@interface Room()

/// A dictionary that keeps track of the rooms adjacent to this one. Key value pairs are the
/// direction and the room adjacent to this one in that direction.
///
@property (nonatomic, strong) NSMutableDictionary *rooms;

/// Registers the specified room and direction in our rooms dictionary.
///
/// @param room
///     The room to set as an adjacent room.w
///
/// @param direction
///     The direction that specifies where the room is located.
///
- (void)setRoom:(Room *)room forDirection:(RoomDirection)direction;


@property (nonatomic, strong) NSMutableArray *items;

///// Registers the specified room and direction in our rooms dictionary.
/////
///// @param room
/////     The room to set as an adjacent room.
/////
///// @param direction
/////     The direction that specifies where the room is located.
/////
- (void)addItem:(Item *)items;

- (NSString*)availableItems;

@end



@implementation Room

#pragma mark - Class methods

+ (RoomDirection)directionForString:(NSString *)string
{
    RoomDirection direction;
    
    if ([string isEqualToString:@"north"])
    {
        direction = RoomDirectionNorth;
    }
    else if ([string isEqualToString:@"south"])
    {
        direction = RoomDirectionSouth;
    }
    else if ([string isEqualToString:@"east"])
    {
        direction = RoomDirectionEast;
    }
    else if ([string isEqualToString:@"west"])
    {
        direction = RoomDirectionWest;
    }
    else
    {
        direction = RoomDirectionInvalid;
    }
    
    return direction;
}

#pragma mark - Init and dealloc methods

- (id)initWithName:(NSString *)name
{
    self = [super init];

    if (self)
    {
        _name = name;
        _rooms = [NSMutableDictionary dictionary];
        _items = [NSMutableArray array];
    }

    return self;
}

#pragma mark - Private methods

- (void)setRoom:(Room *)room forDirection:(RoomDirection)direction
{
    [self.rooms setObject:room forKey:[NSNumber numberWithInteger:direction]];
}

- (void)addItem:(Item *)item
{
    [self.items addObject:item];
}


#pragma mark - Instance methods

- (Room *)roomForDirection:(RoomDirection)direction
{
    return [self.rooms objectForKey:[NSNumber numberWithInteger:direction]];
}

- (void)setNorthEntranceTo:(Room *)room
{
    [self setRoom:room forDirection:RoomDirectionNorth];
    [room setRoom:self forDirection:RoomDirectionSouth];
}

- (void)setEastEntranceTo:(Room *)room
{
    [self setRoom:room forDirection:RoomDirectionEast];
    [room setRoom:self forDirection:RoomDirectionWest];
}

- (void)setSouthEntranceTo:(Room *)room
{
    [self setRoom:room forDirection:RoomDirectionSouth];
    [room setRoom:self forDirection:RoomDirectionNorth];
}

- (void)setWestEntranceTo:(Room *)room
{
    [self setRoom:room forDirection:RoomDirectionWest];
    [room setRoom:self forDirection:RoomDirectionEast];
}


#pragma mark - NSObject

- (NSString *)description
{
    return [NSString stringWithFormat:@"You are standing in the %@", self.name];
}


/**
 Returns available items in room in a nice format.
*/

- (NSString *)availableItems
{
    NSUInteger count = [self.items count];
    if (count > 0){
        NSMutableString *itemsString = [NSMutableString string];
        for (NSUInteger i = 0; i < count; i++) {
            Item *myItem = [self.items objectAtIndex: i];
            // myItem.name
            [itemsString appendString:myItem.name];
            
            //if multiple items and not last item in array, add punctuation
            if (count > 1 && i != (count-1)){
                [itemsString appendString:@", "];
            }
        }
        return [NSString stringWithFormat:@"You notice %@ here.", itemsString];
    }
  
    return @"Nothing to see here.";
}


@end
