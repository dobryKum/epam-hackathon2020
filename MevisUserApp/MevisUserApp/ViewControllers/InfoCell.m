//
//  InfoCell.m
//  MevisUserApp
//
//  Created by Лера on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "InfoCell.h"
#import "UIColor+ColorPalette.h"

@implementation InfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)configure {
    [self setupTitleLabel];
    [self setupInfoLabel];
}

-(void)setupTitleLabel {
    self.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
    self.titleLabel.textColor = UIColor.mediumBlue;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
}

-(void)setupInfoLabel {
    self.infoLabel.text = @"rrrr";
    self.infoLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightLight];
    self.infoLabel.textColor = [UIColor blackColor];
    self.infoLabel.textAlignment = NSTextAlignmentLeft;
}

@end
