//
//  Singletonn.h
//  MY_Singleton_Localnoti_Gallery_actionsheet
//
//  Created by ronakj on 4/27/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singletonn : NSObject
{
   // NSMutableDictionary *data_dic;
//NSMutableArray *username;
 // NSMutableArray *email;
    
}
@property (nonatomic,retain) NSMutableArray *username;
@property (nonatomic,retain) NSMutableArray *email;
@property (nonatomic,retain) NSMutableArray *image;
+ (id)sharedManager;

@end
