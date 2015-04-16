//
//  NSTimer+HYBExtension.m
//  HYBTimerExtension
//
//  Created by huangyibiao on 15/4/16.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import "NSTimer+HYBExtension.h"

@implementation NSTimer (HYBExtension)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    repeats:(BOOL)repeats
                                   callback:(HYBVoidBlock)callback {
  return [NSTimer scheduledTimerWithTimeInterval:interval
                                          target:self
                                        selector:@selector(onTimerUpdateBlock:)
                                        userInfo:[callback copy]
                                         repeats:repeats];
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      count:(NSInteger)count
                                   callback:(HYBVoidBlock)callback {
  if (count <= 0) {
    return [self scheduledTimerWithTimeInterval:interval repeats:YES callback:callback];
  }
  
  NSDictionary *userInfo = @{@"callback"     : [callback copy],
                             @"count"        : @(count)};
  return [NSTimer scheduledTimerWithTimeInterval:interval
                                          target:self
                                        selector:@selector(onTimerUpdateCountBlock:)
                                        userInfo:userInfo
                                         repeats:YES];
}

+ (void)onTimerUpdateBlock:(NSTimer *)timer {
  HYBVoidBlock block = timer.userInfo;
  
  if (block) {
    block();
  }
}

+ (void)onTimerUpdateCountBlock:(NSTimer *)timer {
  static NSUInteger currentCount = 0;
  
  NSDictionary *userInfo = timer.userInfo;
  HYBVoidBlock callback = userInfo[@"callback"];
  NSNumber *count = userInfo[@"count"];
  
  if (currentCount < count.integerValue) {
    currentCount++;
    if (callback) {
      callback();
    }
  } else {
    currentCount = 0;
    
    [timer unfireTimer];
  }
}

- (void)fireTimer {
  [self setFireDate:[NSDate distantPast]];
}

- (void)unfireTimer {
  [self setFireDate:[NSDate distantFuture]];
}

- (void)invalid {
  if (self.isValid) {
    [self invalidate];
  }
}

@end
