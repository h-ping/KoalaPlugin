//
//  CDVKoalaPlugin.m
//  koala
//
//  Created by mac on 15-3-4.
//
//

#import "CDVKoalaPlugin.h"
#import "Controller_Login.h"
#import "Controller_Purchase.h"
#import "RDVTabBarController.h"

@implementation CDVKoalaPlugin

- (void)do:(CDVInvokedUrlCommand *)command {
    [self.commandDelegate runInBackground:^{
        
        NSString *model=[command.arguments objectAtIndex:0];
        //跳转注册
        if([model isEqualToString:@"register"]) {
            [self performSelectorOnMainThread:@selector(gotoRegisterController) withObject:nil waitUntilDone:NO];
        } else if([model isEqualToString:@"purchase"]) {
            [self performSelectorOnMainThread:@selector(gotoBuyController) withObject:nil waitUntilDone:NO];
        } else if([model isEqualToString:@"copy"]){
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = [command.arguments objectAtIndex:1];
            [self performSelectorOnMainThread:@selector(showMsg) withObject:nil waitUntilDone:NO];
        }else if([model isEqualToString:@"openBrowser"]) {
            NSString *url = [command.arguments objectAtIndex:1];
            BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]];
            if(canOpen) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
            }
        } else {
            //            CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            //            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }
    }];
}

- (void)gotoRegisterController{
    [Controller_Login showWithSender:ApplicationController showRegister:YES];
}

- (void)gotoBuyController {
    UINavigationController *navigation = (UINavigationController *)((RDVTabBarController *)ApplicationController).selectedViewController;
    [Controller_Purchase showWithSender:navigation.topViewController];
}

- (void)showMsg{
    [Tools ShowToastWithContent:@"复制成功"];
}

@end