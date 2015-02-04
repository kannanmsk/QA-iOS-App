//
//  QAModel.m
//  QA
//
//  Created by Robert Irwin on 1/30/14.
//  Copyright (c) 2014 Robert Irwin. All rights reserved.
//  Updated by Nagendran Sankaralingam, Kannan Kuttalam on 2/1/15.
//



#import "QAModel.h"

@interface QAModel()

@property (strong,nonatomic,readonly) NSArray *questions;
@property (strong,nonatomic,readonly) NSArray *answers;
@property (assign) NSInteger questionIndex;
@property (assign) NSUInteger maxIndex;

@end

@implementation QAModel

NSString *pathQ, *pathA;
NSString *contentQ, *contentA;
NSArray *linesQ, *linesA;

- (id) init : (NSString*) lang
{
    if ( self = [super init] )
    {
        

    }
    return self;
}

- (id) setLanguage:(NSMutableString *)lang
{
    
    // Languages string 
    NSString *strQ = [NSString stringWithFormat:@"%@Q", lang];
    NSString *strA = [NSString stringWithFormat:@"%@A", lang];
    
    
    // File Path detection
    pathQ = [[NSBundle mainBundle] pathForResource: strQ ofType:@"txt"];
    pathA = [[NSBundle mainBundle] pathForResource: strA ofType:@"txt"];
    
    // Extracting the contents from File
    contentQ = [NSString stringWithContentsOfFile:pathQ encoding:NSUTF8StringEncoding error:NULL];
    contentA = [NSString stringWithContentsOfFile:pathA encoding:NSUTF8StringEncoding error:NULL];
    
    // Storing into an Array
    linesQ =  [contentQ componentsSeparatedByString: @"\n"];
    linesA =  [contentA componentsSeparatedByString: @"\n"];
    
    _questions = linesQ;
    _answers = linesA;
    
    _questionIndex = -1;
    _maxIndex = [_questions count];

    return self;
}


- (NSString *) nextQuestion
{
    self.questionIndex += 1;
    if ( self.questionIndex >= self.maxIndex )
        self.questionIndex = 0;
    
    return [self.questions objectAtIndex: self.questionIndex];
}

- (NSString *) currentAnswer
{
    if ( 0 <= self.questionIndex  &&  self.questionIndex < self.maxIndex )
        return [self.answers objectAtIndex: self.questionIndex];
    return @"Messed up model!";
}

@end
