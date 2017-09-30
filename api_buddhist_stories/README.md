# README
# Api Buddhist Stories Core

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
### Environment installation steps:

* Ruby version
- Clone the repo
	- https://github.com/mariogomez/buddhist-stories.git

* System dependencies
- Update your MacOS to Sierra

* Configuration
- Download and install VirtualBox
	- [VirtualBox 5.1.26](http://download.virtualbox.org/virtualbox/5.1.26/VirtualBox-5.1.26-117224-OSX.dmg)
	- run `VBoxManage --version` to confirm installation

* Database creation
- Download and install Vagrant
	- [Vagrant 1.9.7](https://releases.hashicorp.com/vagrant/1.9.7/vagrant_1.9.7_x86_64.dmg?)
	- run `vagrant --version` to confirm installation
- Install the vagrant-dns plugin
	- `vagrant plugin install vagrant-dns`
- Install brew
	-	`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Install ansible using brew
	- `brew install ansible`
- Get your virtual machine up and running
	- `vagrant up`
- Do the fix for vagrant-dns
	- run the following commands:
		- `vagrant dns --stop`
		- `vagrant dns --uninstall`
		- `vagrant dns --install`
		- `vagrant dns --start`
- SSH into vagrant machine
    - `vagrant ssh`
    - `cd /vagrant`
		- you are now in the shared space between your machine and vagrant

### Database setup
- Install [Sequel Pro](https://sequelpro.com/download), that is the mysql manager most of us use
- Install [mysql](https://dev.mysql.com/downloads/mysql/) in your machine (not vagrant)
- Open up a terminal and add `mysql` to your `PATH` if it isn't set already

- From that terminal open a `mysql` terminal from your local env
  - `mysql -u root -p`
  - Run the following `SQL` commands:
  ```sql
  GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
  ```
  ```sql 
  FLUSH PRIVILEGES;
  ```
  ```sql 
  SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');
  ```
  ```sql 
  CREATE DATABASE buddhist_database;
  ```
  -

- Get the most recent full db backup and import it from Sequel Pro.
- Change the default configuration into the `config/database.yml` file, and copy the following contents in order to connect to our local database (not vagrant env):
```yml
default: &default
	adapter: mysql2
	encoding: utf8
	database: buddhist_database
	username: root
	password: root
	host: 10.0.2.2
	pool: 10
	timeout: 5000
```

- Run bundle install from a vagrant terminal to get all the dependencies of the project.

- After DB import is completed and from a vagrant terminal, run migrations
	- `rake db:migrate`
  - If this goes well, your vagrant virtual machine, and your locally set database are working fine


- Start your server
	- `rails s`

- Test that it is working

- from your browser, try the following Apis:

- POST - User Registration
	- Url: http://localhost:3000/users
	- Body:
```
  	{
  		"user": {
  			"name":"Monica",
  			"email":"monic_stanley@gmail.com",
  			"password":"mon251us",
  			"password_confirmation":"mon251us"
  			}
  		}
```
  - Response:
```  
    {
      "token": "8hcaTd9HWvGcSiKw1EPscCkN"
    }
```

- POST - Login
  - Url: http://localhost:3000/login.json
    -Body form-data:  
```    
    email: monic_stanley@gmail.com
    password: mon251us
```
    - Response:
```
    {
      "token": "T1zyp5Uhkpgo8BAofFpWsLtE"
    }
```

Now that we have the token, we have to add it to the header of the requests that we want to send to the server:

- GET - Get Language by id.
  - Url: http://localhost:3000/languages/1
  - Headers: 
  Key Value
```
  Authorization: Token token=aSFwo7sGxMQUCBXgCdYMLcyb
```
  - Response:
```  
  {
    "id": 1,
    "name": "Spanish",
    "code": "SP",
    "created_at": "2017-09-29T14:34:33.000Z",
    "updated_at": "2017-09-29T14:34:33.000Z"
  }
```




