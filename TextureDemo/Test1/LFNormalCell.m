//
//  LFNormalCell.m
//  TextureDemo
//
//  Created by lanfeng on 2017/7/31.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "LFNormalCell.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TestOneModel.h"

//颜色 两种参数
#define RGB_255(r,g,b) [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:1]

#define RGBA_255(r,g,b,a) [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:a]

@interface LFNormalCell ()
@property (nonatomic, strong) ASImageNode *imageNode;
@property (nonatomic, strong) ASTextNode *titleNode;
@property (nonatomic, strong) ASNetworkImageNode *networkImageNode;
@property (nonatomic, strong) ASNetworkImageNode *smallNetworkImageNode;

@property (nonatomic, strong) TestOneModel *model;
@property (nonatomic, strong) NSDictionary *attrs;
@end

@implementation LFNormalCell

- (instancetype)initWithModel:(TestOneModel *)model {
    if (self = [super init]) {
        [self addSubnode:self.titleNode];
        [self addSubnode:self.networkImageNode];
        [self addSubnode:self.smallNetworkImageNode];
        [self configWithModel:model];
    }
    return self;
}

- (instancetype)initWithViewBlock:(ASDisplayNodeViewBlock)viewBlock {
    if (self = [super initWithViewBlock:viewBlock]) {
        [self addSubnode:self.titleNode];
    }
    return self;
}

#pragma mark - public methods
- (void)configWithModel:(TestOneModel *)model {
    self.model = model;
    
    self.titleNode.attributedText = [[NSAttributedString alloc] initWithString:model.title.length ? model.title : @"" attributes:self.attrs];
    self.networkImageNode.URL = [NSURL URLWithString:model.image];
    self.smallNetworkImageNode.URL = [NSURL URLWithString:model.smallImage];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    if (self.model.image.length) {
        self.networkImageNode.style.preferredSize = CGSizeMake(84, 62);
    } else {
        self.networkImageNode.style.preferredSize = CGSizeZero;
    }
    
    if (self.model.smallImage.length) {
        self.smallNetworkImageNode.style.preferredSize = CGSizeMake(50, 40);
    } else {
        self.smallNetworkImageNode.style.preferredSize = CGSizeZero;
    }
    
//    self.networkImageNode.style.minSize = CGSizeZero;
    
    self.titleNode.style.flexShrink = YES;
    
    
    ASStackLayoutSpec *verticalStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[self.titleNode, self.smallNetworkImageNode]];
    verticalStackLayout.style.flexShrink = YES;
    
    ASStackLayoutSpec *horStackLayout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart flexWrap:ASStackLayoutFlexWrapNoWrap alignContent:ASStackLayoutAlignContentStart children:@[self.networkImageNode, verticalStackLayout]];
    
    ASInsetLayoutSpec *insetLayout = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:horStackLayout];
    return insetLayout;
}

#pragma mark - getters and setters

- (ASImageNode *)imageNode {
    if (!_imageNode) {
        _imageNode = [[ASImageNode alloc] init];
        _imageNode.backgroundColor = [UIColor lightGrayColor];
    }
    return _imageNode;
}

- (ASNetworkImageNode *)networkImageNode {
    if (!_networkImageNode) {
        _networkImageNode = [[ASNetworkImageNode alloc] init];
        _networkImageNode.backgroundColor = [UIColor lightGrayColor];
    }
    return _networkImageNode;
}

- (ASNetworkImageNode *)smallNetworkImageNode {
    if (!_smallNetworkImageNode) {
        _smallNetworkImageNode = [[ASNetworkImageNode alloc] init];
        _smallNetworkImageNode.backgroundColor = [UIColor lightGrayColor];
    }
    return _smallNetworkImageNode;
}

- (ASTextNode *)titleNode {
    if (!_titleNode) {
        _titleNode = [[ASTextNode alloc] init];
        _titleNode.placeholderEnabled = YES;
        _titleNode.layerBacked = YES;
        _titleNode.maximumNumberOfLines = 0;
//        NSDictionary *attrs = @{
//                                NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-bold" size:16.0f],
//                                NSForegroundColorAttributeName : RGB_255(36, 36, 36),
//                                };
//        _titleNode.attributedText = [[NSAttributedString alloc] initWithString:@"" attributes:attrs];
    }
    return _titleNode;
}

- (NSDictionary *)attrs {
    if (!_attrs) {
        _attrs = @{
                   NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-bold" size:16.0f],
                   NSForegroundColorAttributeName : RGB_255(36, 36, 36),
                   };
    }
    return _attrs;
}

@end
