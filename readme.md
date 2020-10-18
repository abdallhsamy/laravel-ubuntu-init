
# laravel-ubuntu-init


## Introduction

LNMP installation script for Ubuntu 20.04, and set up domestic mirror acceleration.

Please make sure all commands start with root Account execution, if the login account is not root，You need to execute `sudo -H -s` Switch to root Download and install after account.


## Software list


* Git
* PHP 7.4
* Nginx
* MySQL
* Sqlite3
* Composer
* Nodejs 10
* Yarn
* Redis
* Beanstalkd
* Memcached

## Optional software list


The following software needs to manually execute the installation script:

* Elasticsearch：`./20.04/install_elasticsearch.sh`,The default is 6.x，If you want to install 7.x Then execute `./20.04/install_elasticsearch.sh 7`

## installation steps


```
wget -qO- https://raw.githubusercontent.com/abdallhsamy/laravel-ubuntu-init/master/download.sh - | bash
```

This script will download the installation script to the current user’s Home Under the directory `laravel-ubuntu-init` Directory and automatically execute the installation script, which will be output on the screen after the installation is over Mysql root Please keep the account password properly.


If not currently root Account will not be automatically installed, you need to switch to root Execute after account `./20.04/install.sh`。

## usage

### 1. Add Nginx site

```
./20.04/nginx_add_site.sh
```

You will be prompted to enter the site name（Can only be English, numbers, `-` and `_`）、Domain name (multiple domain names are separated by spaces)，After confirmation, the corresponding Nginx configuration will be created and Nginx restarted.


### 2. Add Mysql user and database

```
./20.04/mysql_add_user.sh
```

You will be prompted to enter the root password, if you make a mistake, you cannot continue. Enter the Mysql user name to be created, and confirm whether a database corresponding to the user name needs to be created.

After creation, the password of the new user will be output to the screen, please keep it properly.

### 3. Execute commands as www-data

This project provides an ʻalias` of `sudowww`, when you need to execute commands as the `www-data` user (such as `git clone project`, `php artisan config:cache`, etc.), you can add it directly before the command Add `sudowww` and add single quotes at both ends of the original command, such as:

```
sudowww 'php artisan config:cache'
```
