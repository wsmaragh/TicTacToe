//
//  AppDelegate.m
//  TicTacToe
//
//  Created by Winston Maragh on 8/25/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

#import "AppDelegate.h"
#import "GameVC.h"


@interface AppDelegate ()

@end



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    GameVC *initialVC = [[GameVC alloc] init];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [_window makeKeyAndVisible];
    _window.rootViewController = initialVC;
    
    return YES;
}

@end
