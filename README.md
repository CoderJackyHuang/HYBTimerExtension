# HYBTimerExtension
A convenience category of NSTimer.

Author: huangyibiao<br/>
Email: huangyibiao520@qq.com<br/>
github：https://github.com/632840804<br/>
CSDN Blog: http://blog.csdn.net/woaifen3344/<br/>
Any quetion? send me an email. Thank you in advance!<br/>

#INSTALL
<code>pod 'HYBTimerExtension', '~> 0.0'</code>

#Note
This is a very useful cagetory of NSTimer.

#Feature
I also provide a common macro file to you, with it, you can reduce some codes in your project.

#USE
<code>
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    repeats:(BOOL)repeats
                                   callback:(HYBVoidBlock)callback;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      count:(NSInteger)count
                                   callback:(HYBVoidBlock)callback;

- (void)fireTimer;

- (void)unfireTimer;
 
- (void)invalid;

</code>
