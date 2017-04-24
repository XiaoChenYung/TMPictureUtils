//
//  TMAlbum.m
//  TMPictureUtils
//
//  Created by tm on 2017/4/24.
//  Copyright © 2017年 tm. All rights reserved.
//

#import "TMAlbum.h"

@implementation TMAlbum

+ (instancetype)createAlbumWithPhcollection:(PHCollection *)collection {
    TMAlbum *album = [[TMAlbum alloc] init];
    PHAssetCollection * assetCollection = (PHAssetCollection *)collection;
    album.modeCollection = assetCollection;
    if ([assetCollection.localizedTitle isEqualToString:@"Camera Roll"]) {
        album.albumName = @"相机胶卷";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Recently Added"]) {
        album.albumName = @"最近增加";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Recently Deleted"]) {
        album.albumName = @"最近删除";
    }else
    if ([assetCollection.localizedTitle isEqualToString:@"Screenshots"]) {
        album.albumName = @"屏幕快照";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Hidden"]) {
        album.albumName  = @"隐藏";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Bursts"]) {
        album.albumName = @"连拍照片";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Selfies"]) {
        album.albumName = @"自拍照";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Panoramas"]) {
        album.albumName = @"全景相册";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Favorites"]) {
        album.albumName = @"个人收藏";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Time-lapse"]) {
        album.albumName = @"延时照片";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Videos"]) {
        album.albumName = @"视频";
    }else if ([assetCollection.localizedTitle isEqualToString:@"Slo-mo"]) {
        album.albumName = @"慢动作相册";
    }else if([assetCollection.localizedTitle isEqualToString:@"Depth Effect"]) {
        album.albumName = @"深度效果";
    } else if([assetCollection.localizedTitle isEqualToString:@"Live Photos"]) {
        album.albumName = @"动图";
    } else {
        album.albumName = assetCollection.localizedTitle;
    }
    
    return album;
}

@end
