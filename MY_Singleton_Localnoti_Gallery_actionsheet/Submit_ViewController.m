//
//  Submit_ViewController.m
//  MY_Singleton_Localnoti_Gallery_actionsheet
//
//  Created by ronakj on 4/27/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "Submit_ViewController.h"
#import "Singletonn.h"
@interface Submit_ViewController ()<UIImagePickerControllerDelegate>
{
    
 
    Singletonn *objsing;
    
    
//    NSMutableArray *username;
//    NSMutableArray *email;
////
}

@end

@implementation Submit_ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    objsing = [Singletonn sharedManager];
    
    appDel=((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    
    
//    NSLog(@"%@",objsing.self);
//    NSLog(@"%@",objsing.self);
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    
    
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Image"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Camera"
                                                    otherButtonTitles:@"Photo Gallary", nil];
    
    
    
    [actionSheet showInView:self.view];
    
}

//    

//    



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
        if (buttonIndex==0) {
//            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//            picker.allowsEditing = YES;
//            picker.delegate = self;
//            [self presentModalViewController:picker animated:YES];
            [self takeNewPhotoFromCamera];
        }
    
       else if (buttonIndex==1)
        {
//            UIImagePickerController *pickerLibrary = [[UIImagePickerController alloc] init];
//            pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            pickerLibrary.delegate = self;
//            [self presentModalViewController:pickerLibrary animated:YES];
            [self choosePhotoFromExistingImages];
        }
}
- (void)takeNewPhotoFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                    picker.allowsEditing = YES;
                    picker.delegate = self;
                    [self presentModalViewController:picker animated:YES];
    }
    else {
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Camero j  Nahi" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [alert show];
        

    }
}

-(void)choosePhotoFromExistingImages
{
    
                UIImagePickerController *pickerLibrary = [[UIImagePickerController alloc] init];
                pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                pickerLibrary.delegate = self;
                [self presentModalViewController:pickerLibrary animated:YES];

    
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    UIImage *myImage = image;
    
    _myimgview.image=myImage;
    
    
    
    
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    localNotification.alertBody = @"Your alert message";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Submitbtnaction:(id)sender {
    NSInteger success = 0;
    {
        //        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        //       // hud.mode = MBProgressHUDModeAnnularDeterminate;
        //        hud.labelText = @"Loading";
        //
        //        [hud show:YES];
        
        NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
        
//        UIImage* image = [[UIImage alloc] init];                         CGImageRef cgref = [image CGImage];
//        CIImage *cim = [image CIImage];
//        
        
        if(self.myimgview.image==nil)
        {
            UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Please Upload Your Photo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            
            [alert show];
           

            
        }
        else if([self.txt_username.text isEqualToString:@""]){
            
            UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@" Please Enter Username" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            
            [alert show];
            NSLog(@"%@",self.txt_username.text);
        }
        else if([[self.txt_email.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
        {
            
            UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"White Space is Not Allowed in Email Address." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            
            [alert show];
            NSLog(@"%@",self.txt_email.text);
        }
        
       else if ([emailTest evaluateWithObject:_txt_email.text] == NO)
        {
          
            UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Please Enter Valid Email Address." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            
            [alert show];
            NSLog(@"%@",self.txt_email.text);
        }
     
       
        
        
//             
//           else if (cim == nil && cgref == NULL)
//           {
//                 UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@" Please Upload Photo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
//                               [alert show];
//            }

           else{
               
           
             [appDel.userNameArray addObject:self.txt_username.text];
             [appDel.emailArray addObject:self.txt_email.text];
             [appDel.imageArray addObject:self.myimgview.image];
               
               self.txt_username.text = nil;
               self.txt_email.text = nil;
               self.myimgview.image = nil;
             
           }
    }
    

}
@end
