class Users

  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'party_dino_bnb_test')
    else
      conn = PG.connect(dbname: 'party_dino_bnb')
    end

    result = conn.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING name, username, email, password")
    Users.new(id: result[0]['id'], name: result[0]["name"], username: result[0]["username"], email: result[0]["email"], password: result[0]["password"])
  end

  # def self.find(column, value)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     conn = PG.connect(dbname: 'party_dino_bnb_test')
  #   else
  #     conn = PG.connect(dbname: 'party_dino_bnb')
  #   end
  #
  #   result = conn.exec("SELECT username FROM users WHERE #{column} = '#{value}'")
  #   res = result.map do |row|
  #     Spaces.new(id: row["id"], name: row["name"], description: row["description"], price: row["price"], available_from: row["available_from"], available_to: row["available_to"])
  #   end
  #   search_result = res[0]
  # end

end
