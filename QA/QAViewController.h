//
//  QAViewController.h
//  QA
//
//  Created by Robert Irwin on 1/30/14.
//  Copyright (c) 2014 Robert Irwin. All rights reserved.
//  Updated by Nagendran Sankaralingam, Kannan Kuttalam on 2/1/15.
//

@import UIKit;

@interface QAViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property NSMutableArray *pickerData;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (weak, nonatomic) IBOutlet UIPickerView *uiPicker;

- (IBAction)showQuestion:(UIButton *)sender;
- (IBAction)showAnswer:(UIButton *)sender;

@end
