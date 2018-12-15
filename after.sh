#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
#
# If you have user-specific configurations you would like
# to apply, you may also create user-customizations.sh,
# which will be run after this script.

# sudo apt install avahi-utils -y

laravel_worker_block="[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /home/vagrant/code/artisan queue:work
autostart=true
autorestart=true
user=vagrant
numprocs=1
redirect_stderr=true
stdout_logfile=/home/vagrant/code/storage/logs/queue.log"

laravel_websockets_block="[program:laravel-websockets]
process_name=%(program_name)s_%(process_num)02d
command=php /home/vagrant/code/artisan websockets:serve
autostart=true
autorestart=true
user=vagrant
numprocs=1
redirect_stderr=true
stdout_logfile=/home/vagrant/code/storage/logs/websockets.log"

sudo sh -c "echo '$laravel_worker_block' > '/etc/supervisor/conf.d/laravel-worker.conf'"
sudo sh -c "echo '$laravel_websockets_block' > '/etc/supervisor/conf.d/laravel-websockets.conf'"

sudo supervisorctl reread
sudo supervisorctl update
