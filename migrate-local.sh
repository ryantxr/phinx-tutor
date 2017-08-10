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
