//
//  QAModel.h
//  QA
//
//  Created by Robert Irwin on 1/30/14.
//  Copyright (c) 2014 Robert Irwin. All rights reserved.
//  Updated by Nagendran Sankaralingam, Kannan Kuttalam on 2/1/15.
//

@import Foundation;

@interface QAModel : NSObject

- (NSString *) nextQuestion;
- (NSString *) currentAnswer;
- (id) setLanguage: (NSString *) lang;

@end
