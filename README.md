# Official PictShare Docker image
The fastest way to deploy PictShare

[![Docker setup](http://www.pictshare.net/b65dea2117.gif)](https://www.pictshare.net/8a1dec0973.mp4)

## Starting
docker run -d -v /data/pictshareuploads:/opt/pictshare/upload -p 80:80 --name=pictshare hascheksolutions/pictshare

## ENV Variables
- TITLE (string | Title of the page)
- MASTERDELETECODE (string | code if added to any url, will delete the image)
- BLOATING (true/false | can images be bloated to higher resolutions than the originals)
- UPLOADCODE (string | code that has to be supplied to upload an image)
- UPLOADPATH (string | absolute path where upload gui will be shown)
- LOWPROFILE (string | won't display error messages on failed uploads)
- IMAGECHANGECODE (string | code if provided, needs to be added to image to apply filter/rotation/etc)
- LOGUPLOADER (true/false | log IPs of uploaders)
- MAXRESIZEDIMAGES (int | how many versions of a single image may exist? -1 for infinite)
- DOMAIN (string | force all URLs to domain)
- SHOWERRORS (true/false | show upload/size/server errors?)