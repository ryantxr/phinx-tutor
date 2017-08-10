# Phinx Tutorial
This is a quick start for Phinx.

We will create a project called Raven.

You will need:
* MySQL
* A folder for the Raven files
* Composer

## Make the raven folder

`mkdir raven && cd raven`

Using a text editor make a file named **composer.json** and add the following to it:

```
{
    "require": {
        "robmorgan/phinx": "*"
    }
}
```

_* assumes you have composer installed_

Run composer:

`composer install`

You will see the following output:
>Loading composer repositories with package information
>Updating dependencies (including require-dev)
>Package operations: 8 installs, 0 updates, 0 removals
>  - Installing symfony/yaml (v3.3.6): Loading from cache
>  - Installing psr/log (1.0.2): Loading from cache
>  - Installing symfony/debug (v3.3.6): Loading from cache
>  - Installing symfony/polyfill-mbstring (v1.4.0): Loading from cache
>  - Installing symfony/console (v3.3.6): Loading from cache
>  - Installing symfony/filesystem (v3.3.6): Loading from cache
>  - Installing symfony/config (v3.3.6): Loading from cache
>  - Installing robmorgan/phinx (v0.8.1): Loading from cache
>symfony/console suggests installing symfony/event-dispatcher ()
>symfony/console suggests installing symfony/process ()
>Writing lock file
>Generating autoload files

## Make a Phinx YML file
Create a text file named **local-phinx.yml** and in that file put the following:

Replace the name, user, pass and port with the values that 
will work on your system.

```
paths:
    migrations: %%PHINX_CONFIG_DIR%%/migrations

environments:
    default_migration_table: phinxlog
    default_database: development
    production:
        adapter: mysql
        host: localhost
        name: production_db
        user: root
        pass: ''
        port: 3306
        charset: utf8

    development:
        adapter: mysql
        host: 127.0.0.1
        name: raven
        user: 'jupiter'
        pass: 'planet'
        port: 3306
        charset: utf8

    testing:
        adapter: mysql
        host: 127.0.0.1
        name: raven_test
        user: jupiter
        pass: 'planet'
        port: 3306
        charset: utf8
```

## Make a shell script to run migrations
Create a text file named **migrate-local.sh** and in that file put the following:

```
PHINX=vendor/robmorgan/phinx/bin/phinx
YML=local-phinx.yml

if [[ "$1" == "" || "$1" == "up"  ]]
then
  echo Migrate
  echo $PHINX migrate -c $YML -e development
  $PHINX migrate -c $YML -e development
elif [[ "$1" == "down" ]]
then
  echo Rollback
  echo $PHINX rollback -c $YML -e development
  $PHINX rollback -c $YML -e development
elif [[ "$1" == "help" ]]
then
	echo "- Use the following command to run migrations"
	echo "  "$0 
	echo "- To rollback, do this"
	echo "  "$0" down"
fi
```

## Make a script for creating new migrations **newmigration.sh**
```
#!/bin/bash
TEMPLATE=Migration.template.php.dist
echo "Enter name of your migration in camel case like this MyNewTable"
read migname

echo "Making migration for" $migname

./vendor/bin/phinx create --template $TEMPLATE --configuration ../phinx.yml $migname
```

## Create a custom migration template
Phinx has a default migration template but we create our own so we can 
add some useful things to it.

See file: **Migration.template.php.dist**

