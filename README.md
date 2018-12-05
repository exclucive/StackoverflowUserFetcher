I used 2 libraries:
1. UIActivityIndicator-for-SDWebImage which is basicly extention of SDWebImage which gives us ability to show activity indicator on the images while they are loading. SDWebImage does all caching logic and image downloading. 
2. MBProgressHUD - progress indicator. Used it to show that the data is loding.
    We can avoid using it, and implement our custom solution with UIActivityIndicator and UILabel.

I didn't use any libraries for networking, because the requirements are pretty easy and I was able to use standard iOS API. Same reason not using any libraries for JSON parsing, I used basic NSDictionary and type conversions.

For interfaces I used Storyboards because it is fast and easy for the current situation.
