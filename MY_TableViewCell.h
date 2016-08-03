//
//  MY_TableViewCell.h
//  MY_Singleton_Localnoti_Gallery_actionsheet
//
//  Created by ronakj on 4/27/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *my_table_img_view;

@property (strong, nonatomic) IBOutlet UILabel *txt_lbl_email;
@property (strong, nonatomic) IBOutlet UILabel *txt_lbl_username;

@end
