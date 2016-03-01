# Theta S Fisheye to Equirectangular in Quartz for live video
An experiment to use OS X Quartz Composer to transform Ricoh Theta S live feed dual fisheye to equirectangular.

Goal is to create a Quartz composition that can be used in camtwist or other live video streaming software to adjust live the output of the theta-s to be suitable for projecting on a web sphere. The flow will go:
* Theta S via USB or HDMI > computer
* Computer to use this Quartz composition from within Camtwist > Media encoder > HLS (via cloud encoding service) > front-end code
* Front-end needs equirectangular image, see this example: https://aframe.io/examples/showcase/sky/

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
