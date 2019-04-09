database is located in root directory under 'click.sql' name.

For updating currency database, use bash command: 
yii currency/currency/index

POST /login:
POST: 		curl -d "username=admin" -d "password=admin" http://click.loc/index.php?r=site%2Flogin
Response: 	{"Access Token":"100-token"}

GET /currencies:
curl -d "Authentication={Access Token}" -d "limit={limit}" -d "offset={offset}" http://click.loc/index.php?r=site%2Fgetcurrencylist
limit ant offset -> optional;
Authentication -> mandatory;

GET /currency:
curl -d "Authentication={Access Token}" -d "id={id}" http://click.loc/index.php?r=site%2Fgetcurrencybyid
Authentication and id -> mandatory;
