//
//  InfoCell.h
//  MevisUserApp
//
//  Created by Лера on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

-(void)configure;
@end

NS_ASSUME_NONNULL_END
