//
//  IDQXCell.h
//  hjoa
//
//  Created by 华剑 on 2017/8/10.
//  Copyright © 2017年 huajian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDQXModel.h"

@protocol passIDQXCellHeight <NSObject>

- (void)passHeightFromIDQXCell:(CGFloat)height;

@end
@interface IDQXCell : UITableViewCell

- (void)creatIDQXApproveUIWithModel:(IDQXModel *)model;

// 确定cell高度 返还给TableView
@property (weak, nonatomic) id<passIDQXCellHeight> passHeightDelegate;



@end
