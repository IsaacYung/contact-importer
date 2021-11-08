# Contact Importer

The application allows users to upload contact files in CSV format and process them in order
to generate a unified contact file.

## Ruby version

`ruby 3.0.2`

`rails 6.1.4`

## System dependencies

To install gems

`$ bundle install`

To install webpack

`$ rails webpacker:install`

## Database

This project use MySQL 8.0.27, mysql2 gem needs native extention to compile

to load mysql by docker

`$ docker-compose up --build`

run migration

`$ rake db:migrate`

the database running by docker needs user with admin permission, alternatively could use local db editing `database.yml` file and will be necessary to run ``rake db:create`

to store files could be necessary execute `rails active_storage:install` command

## How to run the test suite

it was not possible to build the test suite

## How run

to run

`$ rails server`

access `localhost:3000` on first access will be necessary create an user on Sing Up!

## How simulate

csv files formatted `csv\contacts_standard.csv` and unformated `csv\contacts_unstandard.csv` on CSV folder

