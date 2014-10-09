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
  ids = []
  
  array.each do |item|
    HTTParty.post url("/todos"), query: item
  end
  
  all = HTTParty.get url("/todos/")
  
  all.each do |todo|
    ids.push(todo["id"])
  end
end


