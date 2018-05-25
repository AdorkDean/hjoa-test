//
//  SWWJAndGCLWJCell.m
//  hjoa
//
//  Created by 华剑 on 2017/6/13.
//  Copyright © 2017年 huajian. All rights reserved.
//

#import "SWWJAndGCLWJCell.h"
#import "Header.h"

@interface SWWJAndGCLWJCell ()
{
    UIFont *_fnt;
    NSInteger _shang;
    CGFloat _titleHeight;
    CGFloat _noteHeight;
    CGSize _titleSize;
    CGSize _size;
    NSInteger _count;
}

@property (strong, nonatomic) NSArray *titleArr;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *noteLabel;


@end

@implementation SWWJAndGCLWJCell

- (void)creatSWWJAndGCLWJApproveUIWithModel:(SWWJAndGCLWJModel *)model
{
    _titleArr = @[@"申请类型",@"编号",@"申请人",@"申请部门",@"申请时间",
                  @"项目名称",@"对方名称(建设单位)",@"份数",@"项目负责人",@"负责人电话",
                  @"用印类别",@"盖章日期",@"用章事由",@"拟用印鉴名称",@"文件分类",
                  @"存底类型"];
    _fnt = [UIFont systemFontOfSize:15];
    _titleHeight = 0;
    _noteHeight = 0;
    for (int i = 0; i < _titleArr.count; i ++) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = _fnt;
        _titleLabel.textAlignment = NSTextAlignmentRight;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_titleLabel];
        
        _noteLabel = [[UILabel alloc] init];
        _noteLabel.tag = 200 + i;
        _noteLabel.font = _fnt;
        _noteLabel.numberOfLines = 0;
        _noteLabel.textAlignment = NSTextAlignmentLeft;
        _noteLabel.backgroundColor = [UIColor clearColor];
        _noteLabel.textColor = [UIColor blackColor];
        [self creatTextViewWithModel:model andLabel:_noteLabel andCount:i andTitleLabel:_titleLabel andTitleSize:_titleSize];
    }
}

- (void)creatTextViewWithModel:(SWWJAndGCLWJModel *)model andLabel:(UILabel *)label andCount:(int)count andTitleLabel:(UILabel *)titleLabel andTitleSize:(CGSize )titleSize
{
    titleLabel.text = _titleArr[count];
    _titleSize = [titleLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_fnt,NSFontAttributeName, nil]];

    switch (label.tag) {
        case 200:           //  申请类型
            label.text = self.nameCell;
            break;
        case 201:           //  编号
            label.text = model.swIdnum;
            break;
        case 202:           //  申请人
            label.text = model.uiName;
            break;
        case 203:           //  申请部门
            label.text = model.swBranch;
            break;
        case 204:           //  申请时间
            label.text = [[model.swCreattime componentsSeparatedByString:@" "] firstObject];
            break;
        case 205:           //  项目名称
            label.text = model.swProjectname;
            break;
        case 206:           //  对方名称(建设单位)
            label.text = model.swConstruction;
            break;
        case 207:           //  份数
            label.text = [NSString stringWithFormat:@"%@",model.swProjectnum];
            break;
        case 208:           //  项目负责人
            label.text = model.swProjectleader;
            break;
        case 209:           //  负责人电话
            label.text = model.swProjectleaderphone;
            break;
        case 210:           //  用印类别
            if (model.swCategories.integerValue == 0) {
                label.text = @"营销资料";
            }else if (model.swCategories.integerValue == 1) {
                label.text = @"投标资料";
            }else if (model.swCategories.integerValue == 2) {
                label.text = @"其他";
            }
            break;
        case 211:           //  盖章日期
            label.text = [[model.swStamptime componentsSeparatedByString:@" "] firstObject];
            break;
        case 212:           //  用章事由
            label.text = model.swUsereason;
            break;
        case 213:           //  拟用印鉴名称
            if (model.swSealname.integerValue == 0) {
                label.text = @"公章";
            }else if (model.swSealname.integerValue == 1) {
                label.text = @"法人章";
            }else if (model.swSealname.integerValue == 2) {
                label.text = @"出图章";
            }else if (model.swSealname.integerValue == 3) {
                label.text = @"法人签名章";
            }else if (model.swSealname.integerValue == 4) {
                label.text = @"竣工图章";
            }else if (model.swSealname.integerValue == 5) {
                label.text = @"注册建筑师章";
            }else if (model.swSealname.integerValue == 6) {
                label.text = @"注册结构师章";
            }else if (model.swSealname.integerValue == 7) {
                label.text = @"建造师章";
            }else if (model.swSealname.integerValue == 8) {
                label.text = @"造价师章";
            }else if (model.swSealname.integerValue == 9) {
                label.text = @"造价员章";
            }
            break;
        case 214:           //  文件分类
            if (model.swDocumenttype.integerValue == 0) {
                label.text = @"常规类";
            }else if (model.swDocumenttype.integerValue == 1) {
                label.text = @"方案图";
            }else if (model.swDocumenttype.integerValue == 2) {
                label.text = @"施工图";
            }else if (model.swDocumenttype.integerValue == 3) {
                label.text = @"其他";
            }
            break;
        case 215:           //  存底类型
            if (model.ybReservestype.integerValue == 0) {
                label.text = @"原件";
            }else if (model.ybReservestype.integerValue == 1) {
                label.text = @"复印件";
            }else if (model.ybReservestype.integerValue == 2) {
                label.text = @"扫描电子档";
            }else if (model.ybReservestype.integerValue == 3) {
                label.text = @"登记";
            }
            break;
        default:
            break;
    }
    if (label.text == nil || [label.text isEqualToString:@"(null)"] || [label.text isEqual:[NSNull alloc]] || [label.text isEqualToString:@""] || [label.text isEqualToString:@" "]) {
        label.text = @"--";
    }
    _size = [label.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_fnt,NSFontAttributeName, nil]];
    // 当内容文字长度大于label文字显示长度  为多行时。
    if (_size.width > (kscreenWidth - 100) && _titleSize.width > 70) {  // 当标题高度大于内容高度 且都为多行
        _shang = _size.width/(kscreenWidth - 100);
        NSInteger i = _titleSize.width/65;
        if ((i+1)*titleLabel.bounds.size.height > _size.height*(_shang+1)) {    // 标题的高度 大于 内容的高度
            label.frame = CGRectMake(10 + 70 + 10 , 10 + _noteHeight, (kscreenWidth - 100), _size.height*(_shang+1));
            titleLabel.frame = CGRectMake(10, 10 + _noteHeight, 70, (i+1)*_titleSize.height);
            _noteHeight += (i+1)*_titleSize.height+10;
        }else {     // 内容高度 大于 标题高度
            label.frame = CGRectMake(10 + 70 + 10 , 10 + _noteHeight, (kscreenWidth - 100), _size.height*(_shang+1));
            titleLabel.frame = CGRectMake(10, 10 + _noteHeight, 70, (i+1)*_titleSize.height);
            _noteHeight += _size.height*(_shang+1)+10;
        }
    }else if (_size.width > (kscreenWidth - 100)) { // 当标题高度为单行 内容高度为多行，内容高度 大于 标题高度    // 当标题高度为多行时
        _shang = _size.width/(kscreenWidth - 100);
        label.frame = CGRectMake(10 + 70 + 10 , 10 + _noteHeight, (kscreenWidth - 100), _size.height*(_shang+1));
        titleLabel.frame = CGRectMake(10, 10 + _noteHeight, 70, _titleSize.height);
        _noteHeight += _size.height*(_shang+1)+10;
    }else if (_titleSize.width > 70) {  // 当标题高度为多行 内容高度为单行，内容高度 小于 标题高度
        NSInteger i = _titleSize.width/65;
        label.frame = CGRectMake(10 + 70 + 10 , 10 + _noteHeight, (kscreenWidth - 100), _size.height);
        titleLabel.frame = CGRectMake(10, 10 + _noteHeight, 70, (i+1)*_titleSize.height);
        _noteHeight += (i+1)*_titleSize.height+10;
    }else { //  当内容高度为一行时。    //  当都为一行时。
        label.frame = CGRectMake(10 + 70 + 10 , 10 + _noteHeight, (kscreenWidth - 100), _size.height);
        titleLabel.frame = CGRectMake(10, 10 + _noteHeight, 70, _size.height);
        _noteHeight += _size.height + 10;
    }
    [self.contentView addSubview:label];
    
    if (count == _titleArr.count - 1) {
        [self.passHeightDelegate passHeightFromSWWJAndGCLWJCell:_noteHeight + 10];
    }
}


@end
