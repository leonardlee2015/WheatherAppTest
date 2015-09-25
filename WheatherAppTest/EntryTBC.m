//
//  EntryTBC.m
//  WheatherAppTest
//
//  Created by 李南 on 15/8/31.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "EntryTBC.h"
#import "IncrementalNumberAnimaitonVC.h"
#import "EmmiterLayerTestVC.h"
#import "ButtonViewController.h"
#import "PasswardViewController.h"
#import "HumidityViewTestVC.h"
#import "HumidityViewTotalTestVC.h"
#import "MediaTimeFunctionDisplayVC.h"

#define GROUP_TITLE @"group title"
#define GROUP_CONTENTS @"group contents"

#define CONTENT_TITLE @"content title"
#define CONTENT_DESCRIPTION @"content description"
#define CONTENT_CLASS @"content class"
#define CONTENT_STORYBOARD_ID @"content storyboard restoration identifier"


@interface EntryTBC ()
// table view group informations;
@property(nonatomic,strong) NSArray *groups;
@end

@implementation EntryTBC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeTableData];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // initialize tableview
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test viewcontroller"];
    self.tableView.rowHeight = 70;
}
-(void)initializeTableData{
    NSArray *animationEffectTests = @[
                                      @{CONTENT_TITLE:@"Media Timing Function Display ",
                                        CONTENT_DESCRIPTION:@"Media Timing Function Display  vc ",
                                        CONTENT_CLASS:[MediaTimeFunctionDisplayVC class],
                                        CONTENT_STORYBOARD_ID:@""
                                        }
                                      ,
                                      @{CONTENT_TITLE:@"Incremental Number Animaiton",
                                        CONTENT_DESCRIPTION:@"an incremental number animation demo",
                                        CONTENT_CLASS:[IncrementalNumberAnimaitonVC class],
                                        CONTENT_STORYBOARD_ID:@"Incremental Number Animaiton"
                                          }
                                      ,
                                      @{CONTENT_TITLE:@"Pirticles Emmiter Layer ",
                                        CONTENT_DESCRIPTION:@"an CAEmmiterLayer running test",
                                        CONTENT_CLASS:[EmmiterLayerTestVC class],
                                        CONTENT_STORYBOARD_ID:@""
                                        }];
    NSArray *popAnimationTest = @[
                                  @{CONTENT_TITLE:@"Button ViewController Test",
                                    CONTENT_DESCRIPTION:@"an test to test base spring animation",
                                    CONTENT_CLASS:[ButtonViewController class],
                                    CONTENT_STORYBOARD_ID:@""
                                    }
                                  ,
                                  @{CONTENT_TITLE:@"Passward View Security Level View Test",
                                    CONTENT_DESCRIPTION:@"a view to test NSLayoutConstraints Animation test",
                                    CONTENT_CLASS:[PasswardViewController class],
                                    CONTENT_STORYBOARD_ID:@""
                                    }
                                  ];
    NSArray *WeatherAppFunUnit = @[
                                   @{
                                       CONTENT_TITLE:@"Humidity View Test ",
                                       CONTENT_DESCRIPTION:@"an vc for humidity view test ",
                                       CONTENT_CLASS:[HumidityViewTestVC class],
                                       CONTENT_STORYBOARD_ID:@""
                                     }
                                   ,
                                   @{
                                       CONTENT_TITLE:@"Humidity View Total Test ",
                                       CONTENT_DESCRIPTION:@"an vc for humidity view test ",
                                       CONTENT_CLASS:[HumidityViewTotalTestVC class],
                                       CONTENT_STORYBOARD_ID:@""
                                    }
                                   
                                   
                                   ];
    
    _groups = @[@{
                    GROUP_TITLE:@"Weather Application Functional Unit",
                    GROUP_CONTENTS:WeatherAppFunUnit
                    }
                ,
                @{
                    GROUP_TITLE:@"Pop Animation ",
                    GROUP_CONTENTS:popAnimationTest
                  },
                @{
                    GROUP_TITLE:@"Weather infomation animation effect",
                    GROUP_CONTENTS: animationEffectTests
                  }
                ];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return _groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    NSArray *contents = _groups[section][GROUP_CONTENTS];
    return contents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test viewcontroller"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"test viewcontroller"];
        
    }
    
    // Configure the cell...
    NSArray *groupContents = self.groups[indexPath.section][GROUP_CONTENTS];
    cell.textLabel.text = groupContents[indexPath.row][CONTENT_TITLE];
    cell.detailTextLabel.text = groupContents[indexPath.row][CONTENT_DESCRIPTION];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // get infomation that view will be show
    NSArray *sectionContents = _groups[indexPath.section][GROUP_CONTENTS];
    NSDictionary *testDictionary = sectionContents[indexPath.row];
    NSString *restorationID = testDictionary[CONTENT_STORYBOARD_ID];
    Class aClass = testDictionary[CONTENT_CLASS];
    NSString *title = testDictionary[CONTENT_TITLE];
    
    // create VC and push into  navigationbarController stack.
    UIViewController *vc ;
    if ( restorationID.length > 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        vc = [storyboard instantiateViewControllerWithIdentifier:restorationID];
    }else{
        vc = [[aClass alloc]init];
    }
    vc.title = title;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _groups[section][GROUP_TITLE];
}
/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
