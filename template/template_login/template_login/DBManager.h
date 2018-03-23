//
//  DBManager.h
//  
//
//  Created by CEAC-TC on 23/03/2018.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DBManager : NSObject

@property (nonatomic, strong) NSMutableArray *arrColumnNames;

@property (nonatomic) int affectedRows;

@property (nonatomic) long long lastInsertedRowID;

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSString *databaseFilename;
@property (nonatomic, strong) NSMutableArray *arrResults;

-(NSArray *)loadDataFromDB:(NSString *)query;
-(void)executeQuery:(NSString *)query;
-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;
-(void)copyDatabaseIntoDocumentsDirectory;
-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable;

@end
