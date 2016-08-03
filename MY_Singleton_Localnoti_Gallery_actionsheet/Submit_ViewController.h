//
//  Submit_ViewController.h
//  MY_Singleton_Localnoti_Gallery_actionsheet
//
//  Created by ronakj on 4/27/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singletonn.h"
#import "AppDelegate.h"
@interface Submit_ViewController : UIViewController
{
    AppDelegate *appDel;
}
@property (strong, nonatomic) IBOutlet UIImageView *myimgview;
- (IBAction)Submitbtnaction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt_username;
@property (strong, nonatomic) IBOutlet UITextField *txt_email;


@end
