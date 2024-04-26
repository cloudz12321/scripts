echo '########################################'
echo '#     VoxInstaller V1                  #'
echo '#                                      #'
echo '#     Script created by VoxCorp.       #'
echo '#                                      #'
echo '#     Discord: dsc.gg/vox224           #'
echo '########################################'
sleep 4
clear
echo "Updating Packages"
apt update -y && apt upgrade -y && clear
echo "Lets see the memory ram and storage available on device"
sleep 5
apt install neofetch -y && clear
clear
neofetch
sleep 2
clear
echo "Not bad. Now lets see storage"
sleep 4
df -h
sleep 5
clear
echo "Installing pterodactyl panel"
bash <(curl -s https://pterodactyl-installer.se)
sleep 5
echo "If you want a pterodactyl theme lets the script to install for you :)"
clear
sleep 4
echo 'ATTENTION!'
echo 'YOU NEED TO HAVE PTERODACTYL PANEL INSTALLED ALREADY!' 
sleep 5
clear
echo 'Updating System Packages'
apt update -y
clear
sleep 5
clear
echo 'PTERODACTYL PANEL WILL ENTRY IN MAINTANANCE MODE!'
cd /var/www/pterodactyl
sleep 4
php artisan down
sleep 2
clear
echo 'Adding Nookure Theme to Pterodactyl Panel.'
echo 'Please Wait'
curl -L https://github.com/Nookure/NookTheme/releases/latest/download/panel.tar.gz | tar -xzv
sleep 2
chmod -R 755 storage/* bootstrap/cache
sleep 2
composer install --no-dev --optimize-autoloader
sleep 3
php artisan view:clear
sleep 2
php artisan config:clear
sleep 3
apt install screen -y
clear
sleep 4
php artisan migrate --seed --force
sleep 4
clear
apt install npm -y
npm install pm2 -g && pm2 install pm2-logrotate
sleep 4
clear
echo "Settings permissions for Nginx/Apache2 |LINUX SYSTEM|"
sleep 2
chown -R www-data:www-data /var/www/pterodactyl/*
sleep 5
php artisan queue:restart
sleep 4
clear
echo 'Restarting Pterodactyl Panel'
php artisan queue:restart
sleep 3
clear
echo 'Exit Maintanance Mode'
php artisan up
sleep 4
clear
sleep 4 
echo "Now go to panel to see the changes :)"
echo "Select pm2 or Screen package"
