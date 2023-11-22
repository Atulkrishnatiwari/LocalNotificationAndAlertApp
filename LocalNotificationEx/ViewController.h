//
//  ViewController.h
//  LocalNotificationEx
//
//  Created by Celestial on 17/11/23.
//

#import <UIKit/UIKit.h>
#import "UserNotifications/UserNotifications.h"
@interface ViewController : UIViewController
{
    BOOL isGrantedNotificationAccess;
}

- (IBAction)localNotification:(id)sender;
- (IBAction)alert:(id)sender;
- (IBAction)alert2:(id)sender;

@end

