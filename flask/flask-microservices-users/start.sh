ROOTPATH=~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/
cd $ROOTPATH

# 安装谷歌浏览器，用于testcafe进行浏览器测试
brew cask install google-chrome
# 安装testcafe
npm install -g testcafe

export TEST_URL=http://localhost

testcafe chrome e2e

# docker run -it --rm -v $ROOTPATH/app:/usr/src/app testcafe \
#     # yarn add testcafe \
#     testcafe chrome e2e
