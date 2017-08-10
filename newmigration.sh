#!/bin/bash
TEMPLATE=Migration.template.php.dist
echo "Enter name of your migration in camel case like this MyNewTable"
read migname

echo "Making migration for" $migname

./vendor/bin/phinx create --template $TEMPLATE --configuration ../phinx.yml $migname
