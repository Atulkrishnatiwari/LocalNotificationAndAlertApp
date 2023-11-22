//
//  ViewController.m
//  LocalNotificationEx
//
//  Created by Celestial on 17/11/23.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    isGrantedNotificationAccess=false;
    UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options=UNAuthorizationOptionAlert+UNAuthorizationOptionSound;
    [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) 
     {
        self->isGrantedNotificationAccess=granted;
    }];
}


- (IBAction)localNotification:(id)sender 
{
    if(isGrantedNotificationAccess)
    {
        UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
        
        UNMutableNotificationContent *mutableNotificationContent=[[UNMutableNotificationContent alloc]init];
        mutableNotificationContent.title=@"Atul Tiwari Title";
        mutableNotificationContent.subtitle=@"Atul Subtitle";
        mutableNotificationContent.body=@"Body";
        mutableNotificationContent.sound=[UNNotificationSound defaultSound];
        
        UNTimeIntervalNotificationTrigger *trigger=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
        
        UNNotificationRequest *request=[UNNotificationRequest requestWithIdentifier:@"UYLocalNotification" content:mutableNotificationContent trigger:trigger];
        
        [center addNotificationRequest:request withCompletionHandler:nil];
    }
}

- (IBAction)alert:(id)sender 
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"This is Example of Alert" message:@"open google" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
        if ([[UIApplication sharedApplication] canOpenURL:url])
        {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    [alert addAction:cancelAction];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)alert2:(id)sender
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"" message:@"Do you Want to get Notification" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *action=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
//    {
//        SecondViewController *sVC=[self.storyboard instantiateViewControllerWithIdentifier:@"SecondVC"];
//        [self presentViewController:sVC animated:YES completion:nil];
//    }];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            if(self->isGrantedNotificationAccess)
            {
                UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
            
                UNMutableNotificationContent *mutableNotificationContent=[[UNMutableNotificationContent alloc]init];
                mutableNotificationContent.title=@"Atul Tiwari Title";
                mutableNotificationContent.subtitle=@"Atul Subtitle";
                mutableNotificationContent.body=@"Body";
                mutableNotificationContent.sound=[UNNotificationSound defaultSound];
            
                UNTimeIntervalNotificationTrigger *trigger=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
            
                UNNotificationRequest *request=[UNNotificationRequest requestWithIdentifier:@"UYLocalNotification" content:mutableNotificationContent trigger:trigger];
            
                [center addNotificationRequest:request withCompletionHandler:nil];
        }
        }];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    [alert addAction:cancelAction];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
