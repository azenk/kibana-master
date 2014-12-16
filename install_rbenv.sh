#!/bin/sh
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv init
echo "2.1.5" > .ruby-version
echo "2.1.5" > .rbenv/version
rbenv install 2.1.5
rbenv global 2.1.5
gem install bundler

