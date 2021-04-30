function quickenv
  switch $argv[1]
    case osgeo
      echo "setting osgeo env"
      awsenv openstates
      export DB_HOST=(ssm-param /bobsled/backups/PGHOST)
      export DB_NAME=geo
      export DB_PASSWORD=(ssm-param /passwords/geo_db_password)
      export DB_PORT=5432
      export DB_USER=geo
      export DATABASE_URL="postgres://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_NAME"
      export PGHOST=$DB_HOST
      export PGUSER=$DB_USER
      export PGPASS=$DB_PASSWORD
    case osprod
      echo "setting osprod env"
      awsenv openstates
      export DB_HOST=(ssm-param /bobsled/backups/PGHOST)
      export DB_NAME=openstatesorg
      export DB_PASSWORD=(ssm-param /bobsled/backups/PGPASSWORD)
      export DB_PORT=5432
      export DB_USER=openstates
      export DATABASE_URL="postgres://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_NAME"
      export PGHOST=$DB_HOST
      export PGUSER=$DB_USER
      export PGPASS=$DB_PASSWORD
      export GITHUB_API_KEY=(ssm-param /site/GITHUB_API_KEY)
    case oslocal
      echo "setting oslocal env"
      export DB_HOST=localhost
      export DB_NAME=openstatesorg
      export DB_PASSWORD=openstates
      export DB_PORT=5405
      export DB_USER=openstates
      export DATABASE_URL="postgres://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_NAME"
      export PGHOST=$DB_HOST
      export PGUSER=$DB_USER
      export PGPASS=$DB_PASSWORD
    case bobsled
      echo "setting bobsled env"
      export BOBSLED_SECRET_KEY="not-important"
      export BOBSLED_GITHUB_API_KEY=(ssm-param /bobsled-web/GITHUB_API_KEY)
      export BOBSLED_ENVIRONMENT_PROVIDER=ParameterStoreEnvironmentProvider
      export BOBSLED_ENVIRONMENT_PARAMSTORE_PREFIX=/bobsled
      export BOBSLED_CONFIG_GITHUB_USER=openstates
      export BOBSLED_CONFIG_GITHUB_REPO=task-definitions
      export BOBSLED_TASKS_DIRNAME=tasks
      export BOBSLED_ENVIRONMENT_FILENAME=environments.yml
      export BOBSLED_STORAGE=DatabaseStorage
      export BOBSLED_DATABASE_URI=(ssm-param /bobsled-web/DATABASE_URL)
    case '*'
      echo "no such quickenv: osgeo, osprod, oslocal, bobsled"
  end

end
