//
//  PhotosViewController.h
//  hjoa
//
//  Created by 华剑 on 2017/12/8.
//  Copyright © 2017年 huajian. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol passSelectPhotos <NSObject>

- (void)passSelectPhotosFromPhotosVC:(NSMutableArray *)selectArr;

@end

@interface PhotosViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *data;

@property (weak, nonatomic) id<passSelectPhotos> passDelegate;

@end