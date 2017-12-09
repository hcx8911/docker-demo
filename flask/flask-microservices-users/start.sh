ROOTPATH=~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/
cd $ROOTPATH

export TEST_URL=http://127.0.0.1
export REACT_APP_USERS_SERVICE_URL=http://127.0.0.1
export SECRET_KEY=e090d38ec1ce70d4fa62712718ef9c54f08402eeebba6c02

# 安装谷歌浏览器，用于testcafe进行浏览器测试
# brew cask install google-chrome
# 安装testcafe
# npm install -g testcafe

# 开发
docker-compose up -d --build
docker ps -a
docker-compose exec users-service python manage.py recreate_db
docker-compose exec users-service python manage.py seed_db
# docker-compose exec users-service python manage.py test
docker-compose exec users-service python manage.py cov
docker-compose exec users-eval python manage.py recreate_db
docker-compose exec users-eval python manage.py seed_db
# docker-compose exec users-eval python manage.py test
docker-compose exec users-eval python manage.py cov
# testcafe chrome e2e

docker ps -a
docker-compose down
docker ps -a

# docker-compose exec -ti users-db psql -U postgres -W

# staging
# docker-compose -f docker-compose-staging.yml up -d --build
# docker ps -a
# docker-compose -f docker-compose-staging.yml exec users-service python manage.py recreate_db
# docker-compose -f docker-compose-staging.yml exec users-service python manage.py seed_db
# docker-compose -f docker-compose-staging.yml exec users-service python manage.py test
# docker-compose -f docker-compose-staging.yml exec users-service python manage.py cov
# docker-compose -f docker-compose-staging.yml down
# testcafe chrome e2e

# prod
# docker-compose -f docker-compose-prod.yml up -d --build
# docker ps -a
# docker-compose -f docker-compose-prod.yml exec users-service python manage.py recreate_db
# docker-compose -f docker-compose-prod.yml exec users-service python manage.py seed_db
# docker-compose -f docker-compose-prod.yml exec users-service python manage.py test
# docker-compose -f docker-compose-prod.yml exec users-service python manage.py cov
# docker-compose -f docker-compose-prod.yml down
# testcafe chrome e2e

# docker run -it --rm -v $ROOTPATH/app:/usr/src/app testcafe \
#     # yarn add testcafe \
#     testcafe chrome e2e

# docker images
