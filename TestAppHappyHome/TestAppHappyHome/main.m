//
//  main.m
//  TestAppHappyHome
//
//  Created by Rebecca Yaworsky on 3/6/15.
//  Copyright (c) 2015 U.F.Okechukwu. All rights reserved.
//

#import <Foundation/Foundation.h>


NSString *getLastListValue(NSDictionary *dict) {
    
    NSArray *keys = [dict allKeys];     // get all keys in dictionary
    id key;
    int i ;
    
    for (i = 0; i < [keys count]; i = i+1)
    {
        // loops through all dictionary values to find key with empty value
        key = [keys objectAtIndex: i];
        
        if ([[dict objectForKey: [keys objectAtIndex: i]] isEqualToString:@""]) {
            
            // if found, break out of for loop
            break;
        }
        
        if (i == [keys count] - 1 && ![[dict objectForKey: [keys objectAtIndex: i]] isEqualToString:@""]) {
            return @"invalid list";
        }

    }
    
    return  [keys objectAtIndex: i];
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // Array decleared
        NSDictionary *myToDoDict = @{
                                     @"green" : @"red",
                                     @"yellow" : @"",
                                     @"red" : @"blue",
                                     @"blue" : @"yellow",
                                     };
        
        
        
        NSArray *keys = [myToDoDict allKeys];                           // get list of keys
        NSString *nextValue;                                            // create variable to store current value
        NSMutableArray* dictListArray = [[NSMutableArray alloc]init];   // create an array to list of values
        
        // generate list of values
        for (int i = 0; i < [keys count]; i++){
            
            if (i == 0) {
                nextValue = getLastListValue(myToDoDict);       // get the last value within the array
                [dictListArray addObject:nextValue];            // adds last value to list of values
                
                // if there is no last value, then the list is invalid
                if ([nextValue isEqualToString:@"invalid list"]) {
                    break;
                }
            }else{
                
                // creates an array and stores all values with currentValue name
                NSArray* keysWithValue = [myToDoDict allKeysForObject:nextValue];
                
                // expected array contains one value. add first value to list of values
                [dictListArray addObject:[keysWithValue objectAtIndex:0]];
                
                // set next value to find as last added list value
                nextValue = [keysWithValue objectAtIndex:0];

            }
            
        }
        
        
        NSLog(@"List starting from last value = %@",dictListArray);
        NSLog(@"List starting from first value = %@",[[dictListArray reverseObjectEnumerator] allObjects]);

    }
    return 0;
}
