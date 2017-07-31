//
//  LFTestTwoTableViewCell.m
//  TextureDemo
//
//  Created by lanfeng on 2017/7/31.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "LFTestTwoTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <ReactiveCocoa.h>
#import <Masonry.h>
#import "TestOneModel.h"

@interface LFTestTwoTableViewCell()
@property (nonatomic, strong) UIImageView *bigImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *smallImageView;
@property (nonatomic, strong) TestOneModel *model;
@end

@implementation LFTestTwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.bigImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.smallImageView];
        [self jp_setupSubviews];
    }
    return self;
}

- (void)jp_setupSubviews {
    [self.bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@10);
        make.bottom.equalTo(self.contentView).offset(-10).priority(100);
        make.height.equalTo(@64);
        make.width.equalTo(@87);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bigImageView.mas_right).offset(10);
        make.top.equalTo(self.bigImageView);
        make.right.equalTo(self.contentView).offset(-10);
//        make.bottom.equalTo(self.bigImageView);
    }];
    
    [self.smallImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.width.equalTo(@50);
        make.height.equalTo(@40);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

- (void)jp_layoutWithModel:(TestOneModel *)model {
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
}

- (void)configWithModel:(TestOneModel *)model {
    self.model = model;
    [self.bigImageView setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"Loading-Image"]];
    self.titleLabel.text = model.title;
    [self.smallImageView setImageWithURL:[NSURL URLWithString:model.smallImage] placeholderImage:[UIImage imageNamed:@"Loading-Image"]];
    
    if (model.image.length) {
        [self.bigImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@10);
            make.height.equalTo(@64);
            make.width.equalTo(@87);
        }];
        
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bigImageView.mas_right).offset(10);
        }];
    } else {
        [self.bigImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0);
            make.width.equalTo(@0);
        }];
        
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bigImageView.mas_right).offset(0);
        }];
    }
    
    if (model.smallImage.length) {
        [self.smallImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.height.equalTo(@40);
        }];
    } else {
        [self.smallImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
            make.height.equalTo(@0);
        }];
    }
}

- (UIImageView *)bigImageView {
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc] init];
    }
    return _bigImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIImageView *)smallImageView {
    if (!_smallImageView) {
        _smallImageView = [[UIImageView alloc] init];
    }
    return _smallImageView;
}

@end
