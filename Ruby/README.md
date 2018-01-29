sudo apt-get update
sudo apt-get install curl
sudo apt-get install nodejs
sudo apt-get install libpq-dev
sudo  apt-get install zlib1g zlib1g-dev build-essential sqlite3 libsqlite3-dev openssl libssl-dev libyaml-dev libreadline-dev libxml2-dev libxslt1-dev

curl -L get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
adduser [USER] rvm
rvm requirements
    >>> install the requirements given
log out and back in
add source command to ~/.bash.rc
rvm install 1.9.3
rvm use 1.9.3 --default
rvm rubygems current

sudo gem install rails
sudo gem install sqlite3
sudo gem install pg
sudo gem install bundler


sudo bundle install
sudo bundle update
sudo bundle update rake
sudo bundle exec rails server






Status.create([ { name: 'Open', default: true }, { name: 'Closed' }, { name: 'Deleted' } ])
Priority.create([ { name: 'None', default: true }, { name: 'Low' }, { name: 'Medium' }, { name: 'High' } ])
u = User.new({ email: 'your@email.com', password: 'admin', password_confirmation: 'admin' }); u.agent = true; u.save


# Upgrade Ruby



```bash
    $
    sudo apt-get remove --purge ruby
    cd
    wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.1.tar.gz
    tar -xzvf ruby-2.2.1.tar.gz
    cd ruby-2.2.1/
    ./configure
    make
    sudo make install
    ruby -v
    echo "gem: --no-ri --no-rdoc" > ~/.gemrc
    gem install bundler
```
