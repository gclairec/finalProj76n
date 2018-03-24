//
//  CourseViewController.m
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import "CourseViewController.h"



@implementation CourseViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"schoolyDB"];
    self.tblCourses.delegate = self;
    self.tblCourses.dataSource = self;
    
    [self loadData];
}
- (IBAction)addCourseBtn:(id)sender {
    [self performSegueWithIdentifier:@"addCourse" sender:self];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self loadData];
}

-(void)addingCourseWasFinished{
    // Reload the data.
    [self loadData];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"addCourse"]){
        
        AddCourseViewController *targ = (AddCourseViewController *)[segue destinationViewController];
        [targ setData:_data];
    }
    if([segue.identifier isEqualToString:@"courseDetail"]){
        
        CourseDetailViewController *targ = (CourseDetailViewController *)[segue destinationViewController];
        [targ setData:_data];
    }
}

-(void)loadData{
    // Form the query.
    
    NSLog(@"DATA: %@", _data);
    
    NSString *query = [NSString stringWithFormat:@"select * from coursesInfo where teacher_ID = '%@'", _data[0]];
    
    // Get the results.
    if (self.courses != nil) {
        self.courses = nil;
    }
    self.courses = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    [self.tblCourses reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.courses.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    
//    NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"firstname"];
//    NSInteger indexOfLastname = [self.dbManager.arrColumnNames indexOfObject:@"lastname"];
//    NSInteger indexOfAge = [self.dbManager.arrColumnNames indexOfObject:@"age"];
    
    // Set the loaded data to the appropriate cell labels.
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.courses objectAtIndex:indexPath.row] objectAtIndex:1]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[self.courses objectAtIndex:indexPath.row] objectAtIndex:2]];
    
    return cell;
}


@end


