//
//  main.m
//  PurvaBMI
//
//  Created by Purva Chakarvarti on 9/19/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        /*Person *a,*b;
        a=[Person sharedPerson];
        b=[Person sharedPerson];
        If (a==b)
        {
            NSLog(@"Hi");
        }*/
        /*
         Singleton *a, *b;
         a = [Singleton sharedSingletonInstance];
         NSLog(@"%@", [a description]);
         b = [Singleton sharedSingletonInstance];
         NSLog(@"%@", [b description]);
         // This line will fail if you uncomment it.
         //Singleton *c = [[Singleton alloc] init];
         */
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
