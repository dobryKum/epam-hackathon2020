//
//  LessonsViewController.m
//  MevisUserApp
//
//  Created by Лера on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "LessonsViewController.h"
#import "User.h"
#import "Calendar.h"
#import "LessonCollectionViewCell.h"
#import "UIColor+ColorPalette.h"

@interface LessonsViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    NSInteger _counter;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UICollectionView *lessonsView;

@end

@implementation LessonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.label = [UILabel new];
    self.label.textColor = UIColor.blackColor;
//    self.label.font = [UIFont systemFontOfSize:25];
    self.label.text = @"Мои занятия";
    _counter = 0;
    
    self.imageView = [UIImageView new];
    self.imageView.image = [UIImage imageNamed:@"MevisLogo"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setMinimumInteritemSpacing:0];
    [layout setSectionInset:UIEdgeInsetsMake(0, 0, 5, 0)];
    
    self.lessonsView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    self.lessonsView.backgroundColor = UIColor.whiteColor;
    self.lessonsView.dataSource = self;
    self.lessonsView.delegate = self;
    [self.lessonsView registerClass:[LessonCollectionViewCell class] forCellWithReuseIdentifier:@"lessonCell"];
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.lessonsView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.lessonsView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:30],
        [self.imageView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:20],
        [self.imageView.widthAnchor constraintEqualToConstant:110],
        
        [self.label.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor],
        [self.label.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:100],
        
        [self.lessonsView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10],
        [self.lessonsView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-10],
        [self.lessonsView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
        [self.lessonsView.topAnchor constraintEqualToAnchor:self.label.bottomAnchor constant:20],
    ]];
    
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    long index = indexPath.row + indexPath.section * 4;
    
    NSInteger paidLessonInFuture = self.user.paidLessonCount;
    NSMutableArray *notPaidLessonsInHistory = [NSMutableArray new];
    for (Lesson *element in self.user.lessons) {
        if (notPaidLessonsInHistory.count > -paidLessonInFuture) {
            break;
        }
        if (![element.reasonId isKindOfClass:[NSNull class]]) {
            [notPaidLessonsInHistory addObject:element.id];
        }
    }
    
    typedef NS_ENUM(NSUInteger, LessonStatus) {
        NONE = 0,
        PLANNED,
        PREPAID,
        VISIT_PAID,
        VISIT_NOT_PAID,
        MISSED_NOT_PAID,
        MISSED_FREE,
        MISSED_PAID,
        FORGOT,
        CANCELED
        //, PAUSE(10) don't use
    };
    
    LessonStatus status = NONE;
    
    LessonCollectionViewCell *lessonCell = [self.lessonsView dequeueReusableCellWithReuseIdentifier:@"lessonCell" forIndexPath:indexPath];
    if (index >= self.user.calendar.count) {
        return lessonCell;
    }
    
    Calendar *calendarItem = self.user.calendar[index];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *calIdNum = [f numberFromString:calendarItem.id];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    NSDate *date = [dateFormatter dateFromString:self.user.calendar[index].date];
    dateFormatter.dateFormat = @"E dd.MM";
    NSString *currentDate = [dateFormatter stringFromDate:date];

    lessonCell.monthAndDayDateLabel.text = [currentDate substringFromIndex:3];
    lessonCell.weekDayDateLabel.text = [currentDate substringToIndex:2].capitalizedString;
    
    UIImage *lessonTypeIcon = [UIImage new];
//    UIImageView *lessonStatusIcon = [UIImageView new];
    
    if ([calendarItem.typeId isEqual:@"1"]) {
        lessonTypeIcon = [UIImage imageNamed:@"person_icon"];
    } else if ([calendarItem.typeId isEqual:@"2"]) {
        lessonTypeIcon = [UIImage imageNamed:@"person_stalker"];
    } else if ([calendarItem.typeId isEqual:@"3"]) {
        lessonTypeIcon = [UIImage imageNamed:@"asterisk"];
    } else if ([calendarItem.typeId isEqual:@"4"]) {
        lessonTypeIcon = [UIImage imageNamed:@"paperplane"];
    } else if ([calendarItem.typeId isEqual:@"5"]) {
        lessonTypeIcon = [UIImage imageNamed:@"md_contacts"];
    }
    
    if ([calendarItem.statusId isEqual:@"1"]) {
        if (date && date > [NSDate date]) {
            status = PLANNED;
        } else {
            status = FORGOT;
        }
        if (status == PLANNED && self.user.paidLessonCount > 0) {
            status = PREPAID;
            self.user.paidLessonCount--;
        }
    }
    if ([calendarItem.statusId isEqual:@"2"]) {
        status = CANCELED;
    }
    if ([calendarItem.statusId isEqual:@"3"]) {
        Lesson *lessonItem = self.user.lessons[_counter];
        if ([lessonItem.isAttend isEqual:@1]) {
            status = VISIT_PAID;
            if ([notPaidLessonsInHistory containsObject:calIdNum]) {
                status = VISIT_NOT_PAID;
            }
        }
        if ([lessonItem.isAttend isEqual:@0]) {
            status = MISSED_PAID;
            if ([notPaidLessonsInHistory containsObject:calIdNum]) {
                status = MISSED_NOT_PAID;
            }
        }
        if ([lessonItem.isAttend isEqual:@0] && [lessonItem.price isEqual:@"0.00"]) {
            status = MISSED_FREE;
        }
        _counter++;
    }
    
    if (status == PLANNED) {
        lessonCell.backgroundColor = UIColor.lessonGrayText;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.lessonGray;
        lessonCell.weekDayDateLabel.textColor = UIColor.lessonGray;
    } else if (status == PREPAID) {
        lessonCell.backgroundColor = UIColor.lessonGreen;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.lessonGreenText;
        lessonCell.weekDayDateLabel.textColor = UIColor.lessonGreenText;
        lessonCell.lessonTypeImage.tintColor = UIColor.lessonGreenText;
    } else if (status == VISIT_PAID) {
        lessonCell.backgroundColor = UIColor.lessonGreen;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.lessonGreenText;
        lessonCell.weekDayDateLabel.textColor = UIColor.lessonGreenText;
        lessonCell.lessonTypeImage.tintColor = UIColor.lessonGreenText;
        lessonCell.lessonStatusImage.image = [UIImage systemImageNamed:@"checkmark"];
        lessonCell.lessonStatusImage.tintColor = UIColor.lessonGreenText;
    } else if (status == VISIT_NOT_PAID) {
        lessonCell.backgroundColor = UIColor.lessonRed;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.lessonRedText;
        lessonCell.weekDayDateLabel.textColor = UIColor.lessonRedText;
        lessonCell.lessonTypeImage.tintColor = UIColor.lessonRedText;
        lessonCell.lessonStatusImage.image = [UIImage systemImageNamed:@"xmark"];
        lessonCell.lessonStatusImage.tintColor = UIColor.lessonRedText;
    } else if (status == MISSED_NOT_PAID) {
        lessonCell.backgroundColor = UIColor.lessonRed;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.lessonRedText;
        lessonCell.weekDayDateLabel.textColor = UIColor.lessonRedText;
        lessonCell.lessonStatusImage.image = [UIImage systemImageNamed:@"xmark"];
        lessonCell.lessonStatusImage.tintColor = UIColor.lessonRedText;
    } else if (status == MISSED_FREE) {
        lessonCell.backgroundColor = UIColor.lessonGreen;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.lessonGreenText;
        lessonCell.weekDayDateLabel.textColor = UIColor.lessonGreenText;
        lessonCell.lessonStatusImage.image = [UIImage systemImageNamed:@"checkmark"];
        lessonCell.lessonStatusImage.tintColor = UIColor.lessonGreenText;
    } else if (status == MISSED_PAID) {
        lessonCell.backgroundColor = UIColor.lessonYellow;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.lessonYellowText;
        lessonCell.weekDayDateLabel.textColor = UIColor.lessonYellowText;
        lessonCell.lessonStatusImage.image = [UIImage systemImageNamed:@"minus.circle.fill"];
        lessonCell.lessonStatusImage.tintColor = UIColor.lessonYellowText;
    } else if (status == FORGOT) {
        lessonCell.backgroundColor = UIColor.lessonGray;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.lessonGrayText;
        lessonCell.weekDayDateLabel.textColor = UIColor.lessonGrayText;
        lessonCell.lessonStatusImage.image = [UIImage systemImageNamed:@"questionmark"];
        lessonCell.lessonStatusImage.tintColor = UIColor.lessonGrayText;
    } else if (status == CANCELED) {
        lessonCell.backgroundColor = UIColor.lightGrayColor;
        NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:lessonCell.monthAndDayDateLabel.text];
        NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:lessonCell.weekDayDateLabel.text];
        [str1 addAttribute:NSStrikethroughStyleAttributeName value:(NSNumber *)kCFBooleanTrue range:NSMakeRange(0, str1.length)];
        [str2 addAttribute:NSStrikethroughStyleAttributeName value:(NSNumber *)kCFBooleanTrue range:NSMakeRange(0, str2.length)];
        lessonCell.monthAndDayDateLabel.attributedText = str1;
        lessonCell.weekDayDateLabel.attributedText = str2;
        lessonCell.monthAndDayDateLabel.textColor = UIColor.grayColor;
        lessonCell.weekDayDateLabel.textColor = UIColor.grayColor;
        lessonCell.lessonStatusImage.image = [UIImage systemImageNamed:@"minus.circle.fill"];
        lessonCell.lessonStatusImage.tintColor = UIColor.lessonGrayText;
    }
    
    lessonCell.lessonTypeImage.image = lessonTypeIcon;
//    lessonCell.lessonStatusImage.image = lessonStatusIcon;
    
    return lessonCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    float count = self.user.calendar.count;
    return ceil(count/4);
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(50, 50);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.lessonsView.frame.size.width/4 - 5, self.lessonsView.frame.size.width/4 - 5);
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
    
}

@end
