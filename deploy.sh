cd ~/api_docs
git reset --hard -q origin/master
git pull -q
bundle exec middleman build --clean
cp -r build/* /var/www/html/

