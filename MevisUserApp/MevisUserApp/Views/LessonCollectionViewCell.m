//
//  LessonCollectionViewCell.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "LessonCollectionViewCell.h"
#import "User.h"

@interface LessonCollectionViewCell ()

@end

@implementation LessonCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.backgroundColor = UIColor.whiteColor;
    self.layer.cornerRadius = 10;
    self.monthAndDayDateLabel = [UILabel new];
    self.monthAndDayDateLabel.textColor = UIColor.blackColor;
    
    self.weekDayDateLabel = [UILabel new];
    self.weekDayDateLabel.textColor = UIColor.blackColor;
    self.lessonTypeImage = [UIImageView new];
    self.lessonTypeImage.image = [self.lessonTypeImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.lessonStatusImage = [UIImageView new];
    self.lessonStatusImage.image = [self.lessonStatusImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.lessonStatusImage.contentMode = UIViewContentModeScaleAspectFit;
//    self.lessonStatusImage.image = [UIImage imageNamed:@"empty_flag"];
    
    self.monthAndDayDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.weekDayDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.lessonTypeImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.lessonStatusImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.monthAndDayDateLabel];
    [self addSubview:self.weekDayDateLabel];
    [self addSubview:self.lessonTypeImage];
    [self addSubview:self.lessonStatusImage];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.lessonStatusImage.topAnchor constraintEqualToAnchor:self.topAnchor constant:5],
        [self.lessonStatusImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5],
        [self.lessonStatusImage.widthAnchor constraintEqualToConstant:15],
        [self.lessonStatusImage.heightAnchor constraintEqualToConstant:15],
        
        [self.lessonTypeImage.topAnchor constraintEqualToAnchor:self.topAnchor constant:20],
        [self.lessonTypeImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15],
        [self.lessonTypeImage.widthAnchor constraintEqualToConstant:25],
        [self.lessonTypeImage.heightAnchor constraintEqualToConstant:25],
        
        [self.monthAndDayDateLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.monthAndDayDateLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-15],
        
        [self.weekDayDateLabel.leadingAnchor constraintEqualToAnchor:self.lessonTypeImage.trailingAnchor constant:5],
        [self.weekDayDateLabel.bottomAnchor constraintEqualToAnchor:self.lessonTypeImage.bottomAnchor],
//        [self.lessonTypeImage.topAnchor constraintEqualToAnchor:self.topAnchor constant:15],
//        [self.lessonTypeImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15],
//        [self.lessonTypeImage.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
//        [self.lessonTypeImage.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
    ]];
}


@end
