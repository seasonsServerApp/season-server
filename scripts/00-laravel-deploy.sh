cp /etc/secrets/.env .
cat .env
echo "Running composer"
composer global require hirak/prestissimo
composer install --no-dev --working-dir=/var/www/html

# echo "generating application key..."
# php artisan key:generate --show

echo "Caching config..."
php artisan config:cache

echo "Caching routs..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force
cat .env
