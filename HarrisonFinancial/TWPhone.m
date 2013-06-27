//
//  TWPhone.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 6/26/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWPhone.h"

NSDictionary *params;

@implementation TWPhone

-(id)init {
    if (self = [super init]) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *twimlApp = [defaults stringForKey:@"twiml_app_sid"];

        NSURL* url = [NSURL URLWithString:
                      [NSString stringWithFormat:@"http://devin.webscript.io/generateToken?ClientName=%@&TwimlApp=%@",
                       @"hfDemoApp",
                       twimlApp]];
        
        NSURLResponse* response = nil;
        NSError* error = nil;
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:url]
                                             returningResponse:&response
                                                         error:&error];
        
        if (data)
        {
            NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
            
            if (httpResponse.statusCode == 200)
            {
                NSString* capabilityToken = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                [self setDevice:[[TCDevice alloc] initWithCapabilityToken:capabilityToken delegate:self]];
                
            }
            else
            {
                NSString*  errorString = [NSString stringWithFormat:
                                            @"HTTP status code %d",
                                            httpResponse.statusCode];
                
                NSLog(@"Error logging in: %@", errorString);
            }
        }
        else
        {
            NSLog(@"Error logging in: %@", [error localizedDescription]);
        }
    }
    return self;
}

-(void)connect {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL dialQueue = [defaults boolForKey:@"dial_queue"];
    NSString *targetNumber = [defaults stringForKey:@"remote_phone_number"];
    NSString *sourceNumber = [defaults stringForKey:@"from_phone_number"];

    //convert to string since TwilioClient cannot handle non-string dict values
    NSString * booleanString = (dialQueue) ? @"True" : @"False";

    params = [NSDictionary dictionaryWithObjectsAndKeys:
                            booleanString, @"toQueue",
                            @"hfQueueName", @"queueName", //dynamically generate
                            targetNumber, @"targetNumber",
                            sourceNumber, @"sourceNumber",
                            nil];
    
    if ([self device]) {
        _connection = [[self device] connect:params delegate:nil];
    }
}

-(void)disconnect {
    [_connection disconnect];
    _connection = nil;
}

-(void)connection:(TCConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error.description);
}

//-(void)connectionDidConnect:(TCConnection *)connection {
//    NSLog(@"Connected");
//}

//-(void)connectionDidStartConnecting:(TCConnection *)connection {
//    NSLog(@"StartConnecting");
//}
//
-(void)device:(TCDevice *)device didStopListeningForIncomingConnections:(NSError *)error {
    NSLog(@"StoppedListening");    
}
//
//-(void)deviceDidStartListeningForIncomingConnections:(TCDevice *)device {
//    NSLog(@"StartListening");
//}
//
//-(void)device:(TCDevice *)device didReceiveIncomingConnection:(TCConnection *)connection {
//    
//}
@end
