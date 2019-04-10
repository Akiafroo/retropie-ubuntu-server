#!/bin/bash
sudo sed -i -e '$a\pi ALL=(ALL) NOPASSWD:ALL' /etc/sudoers && 
sudo apt-add-repository universe && sudo apt-get update -y && sudo apt-get upgrade -y && 
sudo apt-get install xorg openbox pulseaudio alsa-utils menu libglib2.0-bin python-xdg at-spi2-core libglib2.0-bin dbus-x11 git dialog unzip xmlstarlet --no-install-recommends -y &&
mkdir ~/.config && mkdir ~/.config/openbox && echo 'gnome-terminal --full-screen --hide-menubar -- emulationstation' >> ~/.config/openbox/autostart &&
echo 'exec openbox-session' >> ~/.xsession &&
echo 'if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then'  >> ~/.bash_profile && sed -i '$ a\  startx -- -nocursor >/dev/null 2>&1' ~/.bash_profile && sed -i '$ a\fi' ~/.bash_profile &&
sudo mkdir /etc/systemd/system/getty@tty1.service.d && sudo sh -c 'echo [Service] >> /etc/systemd/system/getty@tty1.service.d/override.conf' && sudo sed -i '$ a\ExecStart=' /etc/systemd/system/getty@tty1.service.d/override.conf && sudo sed -i '$ a\ExecStart=-/sbin/agetty --skip-login --noissue --autologin pi %I $TERM' /etc/systemd/system/getty@tty1.service.d/override.conf && sudo sed -i '$ a\Type=idle' /etc/systemd/system/getty@tty1.service.d/override.conf &&
sudo sed -i -e 's/session    optional   pam_lastlog.so/#session    optional   pam_lastlog.so/g' /etc/pam.d/login && sudo sed -i -e 's/session    optional   pam_motd.so motd=\/run\/motd.dynamic/#session    optional   pam_motd.so motd=\/run\/motd.dynamic/g' /etc/pam.d/login && sudo sed -i -e 's/session    optional   pam_motd.so noupdate/#session    optional   pam_motd.so noupdate/g' /etc/pam.d/login && sudo sed -i -e 's/session    optional   pam_mail.so standard/#session    optional   pam_mail.so standard/g' /etc/pam.d/login &&
sed -i '1 i\dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ use-theme-colors false' ~/.bash_profile && sed -i '1 i\dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ use-theme-transparency false' ~/.bash_profile && sed -i '1 i\dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ default-show-menubar false' ~/.bash_profile && sed -i "1 i\dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ foreground-color '#FFFFFF'" ~/.bash_profile && sed -i "1 i\dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ background-color '#000000'" ~/.bash_profile && sed -i "1 i\dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ cursor-blink-mode 'off'" ~/.bash_profile && sed -i "1 i\dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ scrollbar-policy 'never'" ~/.bash_profile && sed -i '1 i\dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ audible-bell false' ~/.bash_profile && cp /etc/xdg/openbox/rc.xml ~/.config/openbox/rc.xml && cp ~/.config/openbox/rc.xml ~/.config/openbox/rc.xmlbackup && sed -i '/<applications>/a </application>' ~/.config/openbox/rc.xml && sed -i '/<applications>/a <maximized>true</maximized>' ~/.config/openbox/rc.xml && sed -i '/<applications>/a <decor>no</decor>' ~/.config/openbox/rc.xml && sed -i '/<applications>/a <layer>below</layer>' ~/.config/openbox/rc.xml && sed -i '/<applications>/a <iconic>no</iconic>' ~/.config/openbox/rc.xml && sed -i '/<applications>/a <fullscreen>yes</fullscreen>' ~/.config/openbox/rc.xml && sed -i '/<applications>/a <application class="*">' ~/.config/openbox/rc.xml &&
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git && sudo RetroPie-Setup/retropie_setup.sh &&
