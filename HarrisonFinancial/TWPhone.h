//
//  TWPhone.h
//  HarrisonFinancial
//
//  Created by Devin Rader on 6/26/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCDevice.h"
#import "TCConnection.h"

@interface TWPhone : NSObject <TCConnectionDelegate, TCDeviceDelegate>

@property TCDevice* device;
@property TCConnection* connection;

-(void) connect;
-(void) disconnect;
@end
