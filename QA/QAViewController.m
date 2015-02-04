//
//  QAViewController.m
//  QA
//
//  Created by Robert Irwin on 1/30/14.
//  Copyright (c) 2014 Robert Irwin. All rights reserved.
//  Updated by Nagendran Sankaralingam, Kannan Kuttalam on 2/1/15.
//

#import "QAViewController.h"
#import "QAModel.h"
#import <QuartzCore/QuartzCore.h>

@interface QAViewController ()

@property (strong,nonatomic) QAModel *model;

@end

@implementation QAViewController

NSString * language;

@synthesize question = _question;
@synthesize answer = _answer;
@synthesize model = _model;

- (QAModel *) model
{
    // LAZY INSTANTIATION!
    if (!_model)
        _model = [[QAModel alloc] init];
    return _model;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UIColor *pgcolor;
    //pgcolor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home.jpg"]];
    //[[self view] setBackgroundColor:pgcolor];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Initialize Data
    
    self.pickerData = [[NSMutableArray alloc] initWithObjects:
                  @"Tamil",
                  @"English",
                  @"Spanish",
                  @"French",
                  nil];
    UIColor *pagecolor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]];
    [[self view] setBackgroundColor:pagecolor];
    [self.model setLanguage:@"Tamil"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    // The number of components of data in PickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

    // The number of rows of data in PickerView
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerData count];
}

    // The data to return for the row and component that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerData[row];

}


    // Events to be occured while the picker data gets updated
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    UIColor *pagecolor;

    switch (row) {
        case 0:
            language = @"Tamil";
            [self.model setLanguage:language];
            //pagecolor = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
            pagecolor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]];
            break;
        case 1:
            language = @"English";
            [self.model setLanguage:language];
            pagecolor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.jpg"]];
            break;
        case 2:
            language = @"Spanish";
            [self.model setLanguage:language];
            pagecolor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.jpg"]];
            break;
        case 3:
            language = @"French";
            [self.model setLanguage:language];
            pagecolor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4.jpg"]];
            //targetImage = [UIImage imageNamed:@"4.png"];
            break;
            
        default:
            language = @"Tamil";
            pagecolor = [UIColor whiteColor];
            [self.model setLanguage:language];
            break;
    }
    
    // updating the background
    self.question.text = @"";
    self.answer.text = @"";
    [[self view] setBackgroundColor:pagecolor];

    
    /*// redraw the image to fit |yourView|'s size
    UIGraphicsBeginImageContextWithOptions(yourView.frame.size, NO, 0.f);
    [targetImage drawInRect:CGRectMake(0.f, 0.f, yourView.frame.size.width, yourView.frame.size.height)];
    UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [yourView setBackgroundColor:[UIColor colorWithPatternImage:resultImage]];*/
    
}

- (IBAction)showQuestion:(UIButton *)sender
{
    [self.question setText: [self.model nextQuestion]];
}

- (IBAction)showAnswer:(UIButton *)sender
{
    [self.answer setText: [self.model currentAnswer]];
}

@end