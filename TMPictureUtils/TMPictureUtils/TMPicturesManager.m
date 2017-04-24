//
//  TMPhotosManager.m
//  TMPictureUtils
//
//  Created by tm on 2017/4/24.
//  Copyright © 2017年 tm. All rights reserved.
//

#import "TMPicturesManager.h"

static TMPicturesManager* _instance = nil;

@implementation TMPicturesManager

+ (instancetype)sharePhotoManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[TMPicturesManager alloc] init];
    });
    return _instance;
}

- (void)managerQueryThePHAssetCollectionsFromSmartAlbumsHandleWithCompletion:(void (^)(NSArray<TMAlbum *> *))collectionBlock {
    
}

@end
