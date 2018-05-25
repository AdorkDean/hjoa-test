//
//  HTYYCell.h
//  hjoa
//
//  Created by 华剑 on 2017/6/13.
//  Copyright © 2017年 huajian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTYYModel.h"

@protocol passHTYYCellHeight <NSObject>

- (void)passHeightFromHTYYCell:(CGFloat)height;

@end

@interface HTYYCell : UITableViewCell

- (void)creatHTYYApproveUIWithModel:(HTYYModel *)model;

// 确定cell高度 返还给TableView
@property (weak, nonatomic) id<passHTYYCellHeight> passHeightDelegate;

@end
