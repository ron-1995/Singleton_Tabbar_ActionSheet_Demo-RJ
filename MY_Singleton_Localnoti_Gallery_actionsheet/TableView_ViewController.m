//
//  TableView_ViewController.m
//  MY_Singleton_Localnoti_Gallery_actionsheet
//
//  Created by ronakj on 4/27/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "TableView_ViewController.h"
#import "MY_TableViewCell.h"
#import "Singletonn.h"
#import "AppDelegate.h"
@interface TableView_ViewController ()
{
    Singletonn *objsing;
    
   
    AppDelegate *AppDel;
}
@end

@implementation TableView_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDel=((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    
    
      objsing = [Singletonn sharedManager];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self.my_tableview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [AppDel.userNameArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"cell";
    
    
    MY_TableViewCell *cell = (MY_TableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
        
    {
        
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        
        cell = [nibArray objectAtIndex:0];
        
    }

    
    cell.txt_lbl_username.text = [AppDel.userNameArray objectAtIndex:indexPath.row];
    
   cell.txt_lbl_email.text = [AppDel.emailArray objectAtIndex:indexPath.row];
    
   cell.my_table_img_view.image = [AppDel.imageArray objectAtIndex:indexPath.row];

    
    
    
    return cell;
    
    
    
    
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}

@end
