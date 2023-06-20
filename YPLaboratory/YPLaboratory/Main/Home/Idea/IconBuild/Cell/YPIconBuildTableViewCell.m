//
//  YPIconBuildTableViewCell.m
//  YPLaboratory
//
//  Created by Hansen on 2023/6/15.
//

#import "YPIconBuildTableViewCell.h"
#import "YPIconBuildManager.h"

@interface YPIconBuildTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation YPIconBuildTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.iconImageView];
}

- (void)setCellModel:(YPPageRouter *)cellModel {
    [super setCellModel:cellModel];
    self.titleLabel.text = [YPIconBuildManager shareInstance].iconPath.length ? [YPIconBuildManager shareInstance].iconPath : (cellModel.title?:@"");
    self.iconImageView.image = [YPIconBuildManager shareInstance].iconImage;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    CGRect f1 = bounds;
    f1.origin.x = 20.f;
    f1.size.width = bounds.size.width - f1.origin.x * 2;
    self.titleLabel.frame = f1;
    
    CGRect f2 = bounds;
    f2.size = CGSizeMake(55.f, 55.f);
    f2.origin.y = (bounds.size.height - f2.size.height) / 2.f;
    f2.origin.x = bounds.size.width - f2.size.width - 5.f;
    self.iconImageView.frame = f2;
}

#pragma mark - getters | setters

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14.f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}

@end
