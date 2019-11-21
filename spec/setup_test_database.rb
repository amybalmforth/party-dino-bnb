require 'pg'

p "setting up test database"

def setup_test_database
  conn = PG.connect(dbname: 'party_dino_bnb_test')
  conn.exec("DROP TABLE spaces;")
  conn.exec("CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(60), price VARCHAR(60), available_from VARCHAR(60), available_to VARCHAR(60));
")
  conn.exec("DROP TABLE users;")
  conn.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(60));
;")
end
