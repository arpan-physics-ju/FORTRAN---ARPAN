To make animation use this command:
----------------------------------
For Video(.mp4)
$ ffmpeg -framerate 24 -i frame_%03d.png -c:v libx264 -pix_fmt yuv420p string.mp4

For Animation(.GIF)
ffmpeg -framerate 24 -i image_%04d.png -vf "scale=800:-1:flags=lanczos" -loop 0 output.gif


###############################################
Install FFmpeg

If FFmpeg isn’t already installed, you can install it by running:

    Ubuntu / Debian:

sudo apt update
sudo apt install ffmpeg
###############################################
