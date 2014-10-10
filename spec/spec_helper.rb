require 'rspec'
require 'HTTParty'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end

def url(path)
  "http://lacedeamon.spartaglobal.com#{path}"
end

def delete_all
  all = HTTParty.get url("/todos")
  all.each do |todo|
    HTTParty.delete url("/todos/" + todo["id"].to_s)
  end
end  

def create_todos array
  array.each do |item|
    HTTParty.post url("/todos"), query: item
  end
end

def get_first_id
 ids = []
  
 ids = HTTParty.get url("/todos")
  ids.each do |todo|
    HTTParty.get url("/todos/" + todo[":id"].to_s)
  end
  return ids[0][":id"]
end