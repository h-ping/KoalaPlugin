//
//  CDVKoalaPlugin.h
//  koala
//
//  Created by mac on 15-3-4.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>


@interface CDVKoalaPlugin : CDVPlugin

@property (nonatomic,copy) NSString *callbackID;

- (void)do:(CDVInvokedUrlCommand*)command;

@end