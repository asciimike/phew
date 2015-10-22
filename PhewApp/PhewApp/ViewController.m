//
//  ViewController.m
//  PhewApp
//
//  Created by Mike Mcdonald on 10/22/15.
//  Copyright © 2015 Firebase, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.colorPicker = [[RSColorPickerView alloc] initWithFrame:CGRectMake(0.0, 0.0, 280.0, 280.0)];
  [self.colorPicker setDelegate:self];
  [self.colorPicker setCropToCircle:YES];
  [self.colorPickerHolder addSubview:self.colorPicker];
  
  // Step 1: Set up reference
#error make sure to change this value
  self.ref = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com"];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  // Step 3: Observe changes
  [[self.ref childByAppendingPath:@"devices/phew_bulb"] observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
    NSDictionary *dict = snapshot.value;
    CGFloat red = (CGFloat)[(NSNumber *) dict[@"r"] doubleValue];
    CGFloat green = (CGFloat)[(NSNumber *) dict[@"g"] doubleValue];
    CGFloat blue = (CGFloat)[(NSNumber *) dict[@"b"] doubleValue];
    CGFloat alpha = (CGFloat)[(NSNumber *) dict[@"a"] doubleValue];
    self.colorLabel.text = [NSString stringWithFormat:@"R: %3.0f, G: %3.0f, B: %3.0f", red, green, blue];
    self.colorSwatchHolder.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha/255.0];
  }];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  
  // Step 4: Remove observer(s)
  [self.ref removeAllObservers];
}

- (void)colorPickerDidChangeSelection:(RSColorPickerView *)colorPicker {
  UIColor *currentColor = colorPicker.selectionColor;
  CGFloat red;
  CGFloat green;
  CGFloat blue;
  CGFloat alpha;
  [currentColor getRed:&red green:&green blue:&blue alpha:&alpha];
  
  // Step 2: Push changes to Firebase
  [[self.ref childByAppendingPath:@"devices/phew_bulb"] setValue:@{
                                                                   @"r": [NSNumber numberWithDouble:red*255],
                                                                   @"g": [NSNumber numberWithDouble:green*255],
                                                                   @"b": [NSNumber numberWithDouble:blue*255],
                                                                   @"a": [NSNumber numberWithDouble:alpha*255]
                                                                   }];
}

@end
