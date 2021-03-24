Image frame

Here is software to run on RPI with e-paper display that works as e-frame.
It works in the following way:
1. project is deployed on RPI default user in home directory
1. there is _~/e-frame/img_ directory with black/white images in resolution 800x452px
1. there is also empty directory _~/e-frame/img-archive_
1. once a day script _~/e-frame/nextimage.sh_ is called by crontab
1. script nextimage.sh takes random image from _img_, print it on display and then moves to _img-archive_ directory
1. when _img_ is empty then do next round: move all images from _img-archive_ to _img_

