//
//  TMAlbum.h
//  TMPictureUtils
//
//  Created by tm on 2017/4/24.
//  Copyright © 2017年 tm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface TMAlbum : NSObject
/**
 相册名字
 */
@property (nonatomic, strong) NSString * albumName;
/**
 对相册资源保存一份，方便后面的获取
 */
@property (nonatomic, strong) PHAssetCollection * modeCollection;
/**
 预览图片
 */
@property (nonatomic, strong) UIImage * assetImage;

@end
