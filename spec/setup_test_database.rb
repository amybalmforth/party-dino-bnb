require 'pg'

p "setting up test database"

def setup_test_database
  conn = PG.connect(dbname: 'party_dino_bnb_test')
  conn.exec("TRUNCATE spaces;")
  conn.exec("TRUNCATE users;")
end
