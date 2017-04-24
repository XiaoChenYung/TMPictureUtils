//
//  TMPhotosManager.m
//  TMPictureUtils
//
//  Created by tm on 2017/4/24.
//  Copyright © 2017年 tm. All rights reserved.
//

#import "TMPicturesManager.h"

static TMPicturesManager* _instance = nil;

@interface TMPicturesManager ()

@property (nonnull ,strong, nonatomic) PHFetchResult *pictureFetchResult;

@end

@implementation TMPicturesManager

+ (instancetype)sharePhotoManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[TMPicturesManager alloc] init];
    });
    return _instance;
}

- (void)queryAlbumCompletion:(void (^)(NSArray<TMAlbum *> *))collectionBlock {
    //不通过operations  获取正常下的智能相册
    self.pictureFetchResult= [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    if (self.pictureFetchResult) {
        NSMutableArray <TMAlbum *>* resultArray = [NSMutableArray arrayWithCapacity:self.pictureFetchResult.count];
        [self.pictureFetchResult enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[PHCollection class]]) {
                PHCollection * collection = (PHCollection *)obj;
                TMAlbum * album =   [TMAlbum createAlbumWithPhcollection:collection];
                [resultArray addObject:album];                
            }
        }];
        if (collectionBlock) {
            collectionBlock(resultArray);
        };
    }
}

@end
