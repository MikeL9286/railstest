# for development
# MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
# MongoMapper.database = "#TestRails-#{Rails.env}"

host = 'ds051740.mongolab.com'
port = '51740'
db_name = 'railstest'
user = 'test'
pw = 'password'
 
MongoMapper.connection = Mongo::Connection.new(host, port)
MongoMapper.database = db_name
MongoMapper.database.authenticate(user, pw)

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    MongoMapper.connection.connect if forked
  end
end