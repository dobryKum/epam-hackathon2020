//
//  LessonsViewController.m
//  MevisUserApp
//
//  Created by Лера on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "LessonsViewController.h"
#import "LessonCell.h"

@interface LessonsViewController ()

@property(nonatomic, strong) UILabel *myLessonsLabel;
@property(nonatomic, strong) UICollectionView *lessonsCollectionView;

@end

@implementation LessonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.greenColor;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self setupMyLessonsLabel];
    [self setupCollectionView];
}

- (void)setupMyLessonsLabel {

    self.myLessonsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.layer.frame.size.width, 50)];
    self.myLessonsLabel.text = @"Мои занятия";
    self.myLessonsLabel.backgroundColor = [UIColor whiteColor];
    self.myLessonsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.myLessonsLabel];
}

- (void)setupCollectionView {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    [layout setScrollDirection: UICollectionViewScrollDirectionHorizontal];

    self.lessonsCollectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, 100, self.view.layer.frame.size.width, self.view.layer.frame.size.height) collectionViewLayout:layout];

    self.lessonsCollectionView.delegate = self;
    self.lessonsCollectionView.dataSource = self;
    self.lessonsCollectionView.backgroundColor = [UIColor yellowColor];
    [self.lessonsCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"LessonCell"];
    [self.view addSubview:self.lessonsCollectionView];

}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"LessonCell";
    LessonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;

}

@end
