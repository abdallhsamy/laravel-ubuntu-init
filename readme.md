
# laravel-ubuntu-init

## Introduction

LEMP installation script for Ubuntu 20.04, and set up domestic mirror acceleration.

Please ensure that all commands are executed under the root account. If the login account is not root, you need to execute `sudo -H -s` to switch to the root account before downloading and installing.

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


* Elasticsearch: `./20.04/install_elasticsearch.sh`, the default is 6.x, if you want to install 7.x, execute `./20.04/install_elasticsearch.sh 7`

## installation steps

```
wget -qO- https://raw.githubusercontent.com/abdallhsamy/laravel-ubuntu-init/master/download.sh - | bash
```
This script will download the installation script to the `laravel-ubuntu-init` directory under the current user's Home directory and automatically execute the installation script. After the installation is complete, the password of the Mysql root account will be output on the screen. Please save it properly.

If you are not currently in the root account, it will not be installed automatically, you need to switch to the root account and execute `./20.04/install.sh`.

## Usage

### 1. Add Nginx site

```
./20.04/nginx_add_site.sh
```

You will be prompted to enter the site name (only English, numbers, `-` and `_`), domain name (multiple domain names are separated by spaces), after confirmation, the corresponding Nginx configuration will be created and Nginx restarted.

### 2. Add Mysql user and database

```
./20.04/mysql_add_user.sh
```

You will be prompted to enter the root password, if you make a mistake, you cannot continue. Enter the Mysql user name to be created, and confirm whether a database corresponding to the user name needs to be created.

After creation, the password of the new user will be output to the screen, please keep it properly.

### 3. Execute commands as www-data

This project provides an ʻalias` of `sudowww`, when you need to execute commands as the `www-data` user (such as `git clone project`, `php artisan config:cache`, etc.), you can add it directly before the command On `sudowww`, add single quotes at both ends of the original command, such as：

```
sudowww 'php artisan config:cache'
```
