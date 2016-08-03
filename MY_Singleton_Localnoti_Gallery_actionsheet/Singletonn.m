//
//  Singletonn.m
//  MY_Singleton_Localnoti_Gallery_actionsheet
//
//  Created by ronakj on 4/27/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "Singletonn.h"

@implementation Singletonn

@synthesize username;
@synthesize email;
@synthesize image;

+ (id)sharedManager {
    static Singletonn *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
            });
    return sharedMyManager;
    
    
//    NSLog(@"%@",[Singletonn sharedManager].username);
}

- (id)init {
    if (self = [super init])
    {
       // data_dic = [[NSMutableDictionary alloc]init];
//        [data_dic setObject:@"" forKey:@"username"];
//         [data_dic setObject:@"" forKey:@"email"];
         username = [[NSMutableArray alloc]init];
         email = [[NSMutableArray alloc]init];
       image = [[NSMutableArray alloc]init];
//        NSMutableArray *username;
//        NSMutableArray *email;
        
        
        
    }
    return self;
}
@end
