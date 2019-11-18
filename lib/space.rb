require 'pg'

class Space

  def initialize(id:, name:, description:, price:, available_from:, available_to:)

  end

  def self.create(name:, description:, price:, available_from:, available_to:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'party_dino_bnb_test')
    else
      conn = PG.connect(dbname: 'party_dino_bnb')
    end

    result = conn.exec("INSERT INTO spaces (name, description, price, available_from, available_to) VALUES('#{name}', '#{description}', '#{price}', '#{available_from}', '#{available_to}') RETURNING name, description, price, available_from, available_to")
    Space.new(id: result[0]['id'], name: result[0]["name"], description: result[0]["description"], price: result[0]["price"], available_from: result[0]["available_from"], available_to: result[0]["available_to"])
  end

end
