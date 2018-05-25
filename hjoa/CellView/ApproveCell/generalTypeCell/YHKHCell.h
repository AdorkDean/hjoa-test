//
//  YHKHCell.h
//  hjoa
//
//  Created by 华剑 on 2017/9/1.
//  Copyright © 2017年 huajian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHKHModel.h"

@protocol passYHKHHeight <NSObject>

- (void)passHeightFromYHKH:(CGFloat)height;

@end

@interface YHKHCell : UITableViewCell

- (void)creatYHKHApproveUIWithModel:(YHKHModel *)model;

// 确定cell高度 返还给TableView
@property (weak, nonatomic) id<passYHKHHeight> passHeightDelegate;

@end
