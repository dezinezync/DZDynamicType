/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComDezinezyncDynamictypeModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComDezinezyncDynamictypeModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"08600d16-5686-4913-8d18-45a85f08e766";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.dezinezync.dynamictype";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(textSizeUpdate:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

-(id)preferredSize:(id)args
{
    
    NSString *size = [[UIApplication sharedApplication] preferredContentSizeCategory];
    
    NSLog(@"Text Size String: %@", size);
    
    NSInteger _size = [self sizeFromString:size];
    
    NSLog(@"Text Size: %i", _size);
    
    return [NSNumber numberWithInteger:_size];
    
}

-(void)textSizeUpdate:(NSNotification *)notification
{
    NSString *size = [notification.object valueForKey:@"preferredContentSizeCategory"];
    
    NSInteger _size = [self sizeFromString:size];
    
    if(_size != 0)
    {
        
        [self fireEvent:@"textSize" withObject:@{@"size": [NSNumber numberWithInteger:_size]} propagate:YES];
        
    }
    
}

-(NSInteger)sizeFromString:(NSString *)size
{
    NSInteger _size;
    
    if([size isEqualToString:@"UICTContentSizeCategoryXS"]) {
        _size = 12;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryS"]) {
        _size = 14;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryM"]) {
        _size = 16;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryL"]) {
        _size = 18;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryXL"]) {
        _size = 20;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryXXL"]) {
        _size = 22;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryXXXL"]) {
        _size = 24;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryAccessibilityM"]) {
        _size = 26;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryAccessibilityL"]) {
        _size = 28;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryAccessibilityXL"]) {
        _size = 30;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryAccessibilityXXL"]) {
        _size = 32;
    }
    else if([size isEqualToString:@"UICTContentSizeCategoryAccessibilityXXXL"]) {
        _size = 34;
    }
    else {
        _size = 0;
    }
    
    return _size;
}

@end
