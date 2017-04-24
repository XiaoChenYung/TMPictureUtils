//
//  ViewController.m
//  TMPictureUtils
//
//  Created by tm on 2017/4/24.
//  Copyright © 2017年 tm. All rights reserved.
//

#import "ViewController.h"
#import "TMPicturesManager.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) UITableView  * tableView;
@property (nonatomic,strong) NSMutableArray    *  resultArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultArray =[NSMutableArray array];
    
    self.tableView  = ({
        UITableView * table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
        table.delegate = self;
        table.dataSource = self;
        table.rowHeight = 100;
        
        table;
        
    });
    [self.view addSubview:self.tableView];
    
    [[TMPicturesManager sharePhotoManager] queryAlbumCompletion:^(NSArray<TMAlbum *> *collectionAlbums) {
        [self.resultArray addObjectsFromArray:collectionAlbums];
        [self.tableView reloadData];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMAlbum *album = self.resultArray[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    cell.textLabel.text = album.albumName;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
