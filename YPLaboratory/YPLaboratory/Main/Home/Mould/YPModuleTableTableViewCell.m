//
//  YPModuleTableTableViewCell.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/21.
//

#import "YPModuleTableTableViewCell.h"
#import "YPPageRouter.h"

@interface YPModuleTableTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YPModuleTableTableViewCell

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
}

- (void)setCellModel:(YPPageRouter *)cellModel {
    _cellModel = cellModel;
    self.titleLabel.text = cellModel.title?:@"";
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    CGRect f1 = bounds;
    f1.origin.x = 20.f;
    f1.size.width = bounds.size.width - f1.origin.x * 2;
    self.titleLabel.frame = f1;
}

#pragma mark - getters | setters

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

@end
