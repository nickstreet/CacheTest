CacheTest
=========

This test project is used to demonstrate that the `NSURLSessionDownloadTask`, which operates in a background process, can make use of the iOS caching functionality, but that downloads created through it will not be added to the cache. The consequence of this is that if you download a URL repeatedly via an `NSURLSessionDownloadTask`, no caching behaviour will occur.

Reproduction steps:
-------------------

1. Configure an HTTP traffic sniffer such as Charles
2. Run the app
3. Click the "Test Download Task" button repeatedly, note in Charles that an HTTP request is made for each tap of the button
4. Click the "Test Data Task" button once. Note that an HTTP request is made in Charles
5. Click the "Test Data Task" button as many times as you like. Note that no HTTP requests are made in Charles
6. Click the "Test Download Task" button as many times as you like. Note that no HTTP requests are made in Charles

**Note**: If you want to repeat the test, you will have to reset the simulator, or clear the data in your device. 
