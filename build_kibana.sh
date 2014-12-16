#!/bin/sh

git clone https://github.com/elasticsearch/kibana.git ~/kibana
cd ~/kibana && rbenv local 2.1.5
cd ~/kibana/src/server && bundle && cd ~/kibana
source ~/.nvm/nvm.sh
nvm use 0.10
npm install -g grunt-cli bower
npm install && bower install && cd ~/kibana/src/server && bundle && cd ~/kibana
bundle install
grunt dev --with-es
grunt test build
