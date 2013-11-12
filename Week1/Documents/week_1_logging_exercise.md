## Week 1 Lecture Exercise ###

### Development Setup ###

Download Xcode from the App Store

### 1. Create a new project ###

Open Xcode and from the launcher panel:

1. Select "Create a new Xcode project".
2. On the left pane, select OS X -> "Application".
3. Choose "Command Line Tool" and click *Next*.
4. On the following screen, enter the following:
	a. Product name: SmartFactoryLogger
	b. Organization name: SmartFactory
	c. Company identifier: com.smartfactory
	d. Type: Foundation
5. Choose a folder where the project will be created.  It might be a good idea to create a smartfactory folder inside your Home folder to hold this and any future projects.
6. Click *Create*.
7. Click the play button at the top of project navigator.

If you've set it up correctly, you should see this in the debug window:

	…SmartFactoryLogger[95797:303] Hello, World!
	Program ended with exit code: 0

### 2. Primitives ###

Use `NSLog` to print some values to the console.

Replace the "Hello, World!" line with the following:

	NSLog("I ate %d cookies.", 10);
	NSLog("I ate %f pies.", 3.14529);
	
Click play to run and you should see this in the debug window:

	…SmartFactoryLogger[95932:303] I ate 10 cookies
	…SmartFactoryLogger[95932:303] I ate 3.145900 pies
	Program ended with exit code: 0

Play around with a few different values and [format specifiers](https://developer.apple.com/library/ios/documentation/cocoa/conceptual/Strings/Articles/formatSpecifiers.html).

### 3. Arrays ###

Below the log statements you created earlier, create some `NSString` objects and then create an `NSArray` object to hold them.  Use whatever strings you like, but here's an example:

	NSString *camembert = @"Camembert";
	NSString *gouda = @"Gouda";
	NSString *cheddar = @"Cheddar";
	
	NSArray *cheeses = [[NSArray alloc] initWithObjects:camembert, gouda, cheddar, nil];
		
Loop over the array with fast iteration and use `NSLog` to print each one to the console.

	for (NSString *string in cheeses)
	{
		NSLog(@"A kind of cheese is %@", string);
	}
	
1. Try changing the array creation to use the factory method and then try the literal syntax.
2. See what happens if you do not assign a value to one of the strings.  Now try switching between the alloc/init or factory methods and the literal syntax again.


### 4. Dictionaries ###

Try creating a dictionary with a factory method:

    NSDictionary *stateCapitals = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Saint Paul", @"Minnesota",
                                       @"Des Moines", @"Iowa",
                                       @"Milwaukee", @"Wisconsin", nil];
        
											    
Loop over your dictionary and log out its keys and values

    for (NSString *state in stateCapitals)
    {
        NSLog(@"The capital of %@ is %@", state, [stateCapitals objectForKey:state]);
    }
    
1. Try changing the dictionary creation to use the literal syntax.
2. Change the NSLog statement inside the for loop to use subscripting.
3. Try creating a nested dictionary and use subscripting to access its elements.

### 5. Mutability ###

Create a mutable set and add a few objects

	NSMutableSet *breweries = [NSMutableSet setWithCapacity:3];

    [breweries addObject:@"Fulton"];
	[breweries addObject:@"Surly"];
	[breweries addObject:@"Indeed"];

	NSLog(@"A set of breweries %@", breweries);

1. Try creating an immutable set and making a mutable copy of it.
2. Add and remove objects to the mutable copy and note that the original remains.

### 6. Equality ###

Log some expressions using equality

   	NSString *firstString = @"wat";
   	NSString *secondString = @"wat";

   	NSMutableString *thirdString = [[NSMutableString alloc] init];
   	[thirdString appendString:@"wat"];
   
   	NSLog(@"==: %d", firstString == secondString);
   	NSLog(@"isEqual: %d", [firstString isEqual:secondString]);

   	NSLog(@"==: %d", secondString == thirdString);
   	NSLog(@"isEqual: %d", [secondString isEqual:thirdString]);
   	
1. Try some NSNumbers in similar fashion.
2. Try some collections.







