based on: https://docs.docker.com/samples/rails/
    docker-compose run --no-deps web rails new . --force --database=postgresql
change files permissions after installation on linux
    sudo chown -R $USER:$USER .
Now that you’ve got a new Gemfile, you need to build the image again. (This, and changes to the Gemfile or the Dockerfile, should be the only times you’ll need to rebuild.)
    docker-compose build
Replace the contents of config/database.yml with the following:

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test
```
