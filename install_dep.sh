#setup chromium in kiosk mode
sudo apt update && apt upgrade
sudo apt-get install xserver-xorg-video-all xserver-xorg-input-all xserver-xorg-core xinit x11-xserver-utils

sudo add-apt-repository ppa:xtradeb/apps #<-- doing this because canicol forces a snap of chromium on Ubutnu 20.04 and newer
sudo apt-get install chromium
sudo apt-get install unclutter

Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)

cd ~
echo 'if  ( -z $DISPLAY ) &&  ( $(tty) = /dev/tty1 ); then \
startx; fi' >> ~/.bash_profile

touch .xinitrc
echo -e "#!/bin/sh\n
xset -dpms\n
xset s off\n
xset s noblank\n\n
unclutter &\n
chromium-browser 127.0.0.1:5000 --window-size=$Xaxis,$Yaxis \
--start-fullscreen --kiosk --incognito --noerrdialogs --disable-translate \
--no-first-run --fast --fast-start --disable-infobars --disable-features=TranslateUI \
--disk-cache-dir=/dev/null  --password-store=basic" >> .xinitrc

#install node.js and other needed dep for frontend

curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
npm i riot

#install python packages for backend
pip install moonrackerpy config_io