function quickenv
  switch $argv[1]
    case osgeo
      echo "setting osgeo env"
      awsenv openstates
      export DB_HOST=(aws ssm get-parameter --with-decryption --name /bobsled/backups/PGHOST | jq -r .Parameter.Value)
      export DB_NAME=geo
      export DB_PASSWORD=(aws ssm get-parameter --with-decryption --name /passwords/geo_db_password | jq -r .Parameter.Value)
      export DB_PORT=5432
      export DB_USER=geo
    case osprod
      echo "setting osprod env"
      awsenv openstates
      export DB_HOST=(aws ssm get-parameter --with-decryption --name /bobsled/backups/PGHOST | jq -r .Parameter.Value)
      export DB_NAME=openstatesorg
      export DB_PASSWORD=(aws ssm get-parameter --with-decryption --name /bobsled/backups/PGPASSWORD | jq -r .Parameter.Value)
      export DB_PORT=5432
      export DB_USER=openstates
    case oslocal
      echo "setting oslocal env"
      export DB_HOST=localhost
      export DB_NAME=openstatesorg
      export DB_PASSWORD=openstates
      export DB_PORT=5405
      export DB_USER=openstates
    case '*'
      echo "no such quickenv"
  end

  export DATABASE_URL="postgres://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_NAME"
  export PGHOST=$DB_HOST
  export PGUSER=$DB_USER
  export PGPASS=$DB_PASSWORD
end
