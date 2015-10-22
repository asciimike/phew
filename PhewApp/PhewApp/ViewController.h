//
//  ViewController.h
//  PhewApp
//
//  Created by Mike Mcdonald on 10/22/15.
//  Copyright © 2015 Firebase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

#import "RSColorPickerView.h"

@interface ViewController : UIViewController <RSColorPickerViewDelegate>

@property (strong, nonatomic) Firebase *ref;

@property (strong, nonatomic) RSColorPickerView *colorPicker;
@property (weak, nonatomic) IBOutlet UIView *colorPickerHolder;
@property (weak, nonatomic) IBOutlet UIView *colorSwatchHolder;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;

@end