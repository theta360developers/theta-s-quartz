# Convert Theta-S Live Video from Fisheye to Equirectangular via Quartz
An experiment to use OS X Quartz Composer to transform Ricoh Theta S live feed dual fisheye to equirectangular.

Goal is to create a Quartz composition that can be used in camtwist or other live video streaming software to adjust live the output of the theta-s to be suitable for using in a 360' web panorama plugin. The flow will be something like this:
* Theta S via USB or HDMI > Computer
* Computer to use this Quartz composition from within Camtwist > Media encoder > HLS (via cloud encoding service) > web front-end
* Web front-end needs equirectangular image, see this example: https://aframe.io/examples/showcase/sky/

### Example image files: 
* Sample input file (raw dual fisheye from theta-s): https://github.com/kfarr/theta-s-quartz/blob/master/theta-s-raw-Frame-01-03-2016-02-00-34.jpg
* Example of desired output (this is post-processed by theta-s software, but not available for live streaming): https://github.com/kfarr/theta-s-quartz/blob/master/desired-output-R0010093.jpg

## How to run
* Download quartz composer from Apple's developer site http://developer.apple.com/downloads by searching for "Graphics Tools for Xcode"
* Open theta-fish2sphere.qtz file in quartz composer
* Change input image source to theta s on USB or HDMI input live stream, or use sample image from this git project's root dir

## Current state - not working
* It attempts to take theta footage, crop to 1 of the 2 fisheyes, then rotate 90'
* Then to feed this cropped and isolated fisheye into the fish2sphere quartz plugin
* The fish2sphere quartz plugin doesn't like the cropped and resized input, it returns only black
** Providing fish2spherewith a non-cropped / rotated version of the live feed from theta-s results in a non-black image, however it is not formatted correctly as equirectangular
* quartz plugin DOES work as expected when feeding in image instead in the example (still needs some additional cropping post-output and some add'l adjustment, but proof of concept is there)

## Some helpful docs
* Paul Bourke - Converting a fisheye image into a panoramic or perspective projection - http://paulbourke.net/dome/fish2/
* Another attempt using opencv instead of quartz: https://github.com/kscottz/dewarp/blob/master/fisheye/defish.py
* Another nice blog post: http://www.kscottz.com/fish-eye-lens-dewarping-and-panorama-stiching/
* Theta-S camera: https://theta360.com/en/about/theta/s.html

## TODO
* try recording video from actual usb video output, then try to reproduce error in quartz to share with others to get help debuggin
* contact Paul Bourke for help becuase he seems like a smart guy http://paulbourke.net/
* add pictures to this github readme
