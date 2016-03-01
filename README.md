# Theta S Live Resize in Quartz
An experiment to use OS X Quartz Composer to transform Ricoh Theta S live feed dual fisheye to equirectangular

goal is to create a quartz filter that can be used in camtwist or others to adjust live the output of the theta-s to be suitable for projecting on a web sphere

## Current state - not working
* It has the main components to crop a 16:9 live stream from theta
* It attempst to crop to 1 of the 2 fisheyes, then rotate 90'
* Then to feed the isolated fisheye into the fish2sphere quartz plugin
* The quartz plugin doesn't like the cropped and resized input, it returns only black
* quartz plugin DOES work as expected when feeding in image instead

## Some helpful docs
* Paul Bourke - Converting a fisheye image into a panoramic or perspective projection - http://paulbourke.net/dome/fish2/

## How to run
* Download quartz composer from Apple's developer site http://developer.apple.com/downloads by searching for "Graphics Tools for Xcode"
* Open theta-fish2sphere.qtz file in quartz composer
* Change input image source to theta s on USB or HDMI input live stream, or use sample images from this root dir

## TODO
* try recording video from actual usb video output, then try to reproduce error in quartz to share with others to get help debuggin
* add pictures to this github readme
