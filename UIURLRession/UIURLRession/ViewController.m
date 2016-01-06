//
//  ViewController.m
//  UIURLRession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ModelOfMtime.h"
#import "CellOfContect.h"

@interface ViewController ()<NSURLSessionDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)NSMutableArray *arrOfModel;
@property (nonatomic, retain)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self handleDateByBlock];
    [self creatTableView];
    
}

- (void)handleDateByBlock{
    
    
    
    //获取url
    
    NSURL *url = [NSURL URLWithString:@"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1"];
    
    //创建通道
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    //挂起任务 task
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //解析
        
        NSError *errorJson = nil;
        id resule = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorJson];
        
        
        // 处理数据
        
        NSArray *arr = [resule objectForKey:@"newsList"];
        
        self.arrOfModel = [NSMutableArray array];//初始化数组
        
        for (NSDictionary *dic in arr) {
            
            ModelOfMtime *model = [[ModelOfMtime alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.arrOfModel addObject:model];
            
         //  NSLog(@"model:%@", model.title);
        }
        [self.tableView reloadData];
        
    }];
    
    
    [task resume];
    
    
}

- (void)creatTableView{

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CellOfContect" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool1"];

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrOfModel.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    
 //CellOfContect *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    ModelOfMtime *model = [self.arrOfModel objectAtIndex:indexPath.row];
    
   //[cell handleData:model];
    
    cell.textLabel.text = model.title;
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
