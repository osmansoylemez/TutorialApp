//
//  ViewController.m
//  TutorialApp
//
//  Created by KSMacbook on 17/01/17.
//  Copyright © 2017 KOCSISTEM. All rights reserved.
//

#import "MainViewController.h"
#import "OSGlobals.h"
#import "OSSectionModel.h"
#import "OSRowModel.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *sectionArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _sectionArray = [OSGlobals getMainTableViewArray];
}

#pragma mark - UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    OSSectionModel *sectionModel = [_sectionArray objectAtIndex:section];
    return sectionModel.rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OSSectionModel *sectionModel = [_sectionArray objectAtIndex:indexPath.section];
    OSRowModel *rowModel = [sectionModel.rowArray objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainTableViewCellIdentifier"];
    }
    
    cell.textLabel.text = rowModel.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OSSectionModel *sectionModel = [_sectionArray objectAtIndex:indexPath.section];
    OSRowModel *rowModel = [sectionModel.rowArray objectAtIndex:indexPath.row];
    
    @try {
        UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:rowModel.viewControllerIdentifier];
        [self.navigationController pushViewController:controller animated:YES];
        
    } @catch (NSException *exception) {
        UIAlertController * alert = [UIAlertController
                                      alertControllerWithTitle:@"Oppss"
                                      message:@"Henüz bu ekran hazır değil"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Tamam"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    } @finally {
    
    }
}


@end
