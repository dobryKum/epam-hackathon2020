//
//  LessonCollectionViewCell.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class User;

@interface LessonCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) User* user;
@property (nonatomic, strong) UILabel *monthAndDayDateLabel;
@property (nonatomic, strong) UILabel *weekDayDateLabel;
@property (nonatomic, strong) UIImageView *lessonTypeImage;
@property (nonatomic, strong) UIImageView *lessonStatusImage;

@end

NS_ASSUME_NONNULL_END
