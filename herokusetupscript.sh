git init
git add -A
git commit -m "first commit"
echo web: vendor/bin/heroku-php-apache2 public/ > Procfile
git add -A
git commit -m "Procfile for Heroku"
heroku create
heroku buildpacks:set heroku/php
php artisan key:generate --show > app_key

while read myline
do
  heroku config:set APP_KEY=$myline
done < app_key

rm app_key
git push heroku master
rm herokusetupscript.sh