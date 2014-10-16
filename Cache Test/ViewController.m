
#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

NSString * const kTestUrl = @"http://cdn.sstatic.net/stackoverflow/img/sprites.png?v=3c6263c3453b";

#pragma mark - Data Task

- (IBAction)testDataTaskTapped:(id)sender {
    // Call this as many times as you like. Note that only the first request is made in Charles
    // Subsequent dataTask calls or downloadTask calls will not make HTTP requests
    [self downloadUsingNSURLSessionDataTask:[NSURL URLWithString:kTestUrl]];
}

- (void)downloadUsingNSURLSessionDataTask:(NSURL *)url {
    NSURLSession *session = [self buildSession];
    NSURLRequest *request = [self buildRequestWithURL:url];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    [dataTask resume];
}

#pragma mark - Download Task

- (IBAction)testDownloadTaskTapped:(id)sender {
    // Call this as many times as you like. Note that the request is made in Charles
    // Note that if you have previously called the data task, then no request is made
    [self downloadUsingNSURLSessionDownloadTask:[NSURL URLWithString:kTestUrl]];
}

- (void)downloadUsingNSURLSessionDownloadTask:(NSURL *)url {
    NSURLSession *session = [self buildSession];
    NSURLRequest *request = [self buildRequestWithURL:url];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request];
    [downloadTask resume];
}

-(NSURLSession*)buildSession {
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    return session;
}

-(NSURLRequest*)buildRequestWithURL:(NSURL*)url {
    return [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
}
@end
