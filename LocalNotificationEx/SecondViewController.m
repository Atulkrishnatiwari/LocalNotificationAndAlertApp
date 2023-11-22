//
//  SecondViewController.m
//  LocalNotificationEx
//
//  Created by Celestial on 22/11/23.
//

#import "SecondViewController.h"
#import "UserNotifications/UserNotifications.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

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

@end
