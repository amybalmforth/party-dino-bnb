# require 'pg'
#
# class Spaces
#
#   attr_reader :id, :name, :description, :price, :available_from, :available_to, :created_by, :requested_by, :booked_by
#
#   def initialize(id:, name:, description:, price:, available_from:, available_to:, created_by:)
#     @id = id
#     @name = name
#     @description = description
#     @price = price
#     @available_from = available_from
#     @available_to = available_to
#     @created_by = created_by
#     @requested_by = nil
#     @booked_by = nil
#   end
#
#   def self.create(name:, description:, price:, available_from:, available_to:, created_by:)
#     if ENV['ENVIRONMENT'] == 'test'
#       conn = PG.connect(dbname: 'party_dino_bnb_test')
#     else
#       conn = PG.connect(dbname: 'party_dino_bnb')
#     end
#
#     result = conn.exec("INSERT INTO spaces (name, description, price, available_from, available_to, created_by) VALUES('#{name}', '#{description}', '#{price}', '#{available_from}', '#{available_to}', '#{created_by}') RETURNING name, description, price, available_from, available_to, created_by")
#     Spaces.new(id: result[0]['id'], name: result[0]["name"], description: result[0]["description"], price: result[0]["price"], available_from: result[0]["available_from"], available_to: result[0]["available_to"], created_by: result[0]["created_by"])
#   end
#
#   def self.all
#     if ENV['ENVIRONMENT'] == 'test'
#       conn = PG.connect(dbname: 'party_dino_bnb_test')
#     else
#       conn = PG.connect(dbname: 'party_dino_bnb')
#     end
#
#     result = conn.exec("SELECT * FROM spaces")
#     result.map do |row|
#       Spaces.new(id: row["id"], name: row["name"], description: row["description"], price: row["price"], available_from: row["available_from"], available_to: row["available_to"], created_by: row["created_by"])
#     end
#   end
#
#   def self.find(column, value)
#     if ENV['ENVIRONMENT'] == 'test'
#       conn = PG.connect(dbname: 'party_dino_bnb_test')
#     else
#       conn = PG.connect(dbname: 'party_dino_bnb')
#     end
#
#     result = conn.exec("SELECT * FROM spaces WHERE #{column} = '#{value}'")
#     res = result.map do |row|
#       Spaces.new(id: row["id"], name: row["name"], description: row["description"], price: row["price"], available_from: row["available_from"], available_to: row["available_to"], created_by: row["created_by"])
#     end
#     search_result = res[0]
#   end
#
#   def self.update(id:, name:, description:, price:, available_from:, available_to:)
#       conn = PG.connect(dbname: 'party_dino_bnb')
#
#     result = conn.exec("UPDATE spaces SET (name, description, price, available_from, available_to)=('#{name}', '#{description}', '#{price}', '#{available_from}', '#{available_to}')  WHERE id = '#{id}'")
#   end
#
#   # Following method is used only for tests. Reason for separate methods is because you cannot test test database on ID number.
#
#   def self.testupdate(name:, description:, price:, available_from:, available_to:, created_by:)
#     conn = PG.connect(dbname: 'party_dino_bnb_test')
#
#     result = conn.exec("UPDATE spaces SET (name, description, price, available_from, available_to, created_by)=('#{name}', '#{description}', '#{price}', '#{available_from}', '#{available_to}', '#{created_by}') WHERE description = '#{description}' RETURNING name, description, price, available_from, available_to, created_by")
#
#     res = result.map do |row|
#       Spaces.new(id: row["id"], name: row["name"], description: row["description"], price: row["price"], available_from: row["available_from"], available_to: row["available_to"], created_by: row["created_by"])
#     end
#     res[0]
#   end
#
#   # End of test method
# end

require "data_mapper"
require "dm-postgres-adapter"

class Space
  include DataMapper::Resource

  property :id,                 Serial
  property :name,               String
  property :description,        String
  property :price,              Integer
  property :available_from,     Date
  property :available_to,       Date
  property :created_by,         String
  property :requested_by,       String
  property :booked_by,          String

end
