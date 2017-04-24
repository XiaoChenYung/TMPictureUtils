//
//  TMPhotosManager.h
//  TMPictureUtils
//
//  Created by tm on 2017/4/24.
//  Copyright © 2017年 tm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMAlbum.h"

@interface TMPicturesManager : NSObject

- (void)managerQueryThePHAssetCollectionsFromSmartAlbumsHandleWithCompletion:(void (^)(NSArray <TMAlbum *> * collectionAlbums))collectionBlock;

@end
