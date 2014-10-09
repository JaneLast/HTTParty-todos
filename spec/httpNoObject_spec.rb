require 'spec_helper'
require 'date'

describe "Non-existing object" do  
  before :each do 
    delete_all
    hash = [
         {title: "Todo one", due: Date.today.to_s},
         {title: "Todo two", due: Date.today.to_s},
         {title: "Todo three", due: Date.today.to_s},
         {title: "Todo four", due: Date.today.to_s},
         {title: "Todo five", due: Date.today.to_s},
          ]
   create_todos hash
  end
  
  after :all do
    delete_all
  end

  # Test 1 - To GET the todo with ID 1
  it "Should GET the todo with ID 1" do
    r = HTTParty.get url("/todos/1"),
                      query: {}
    expect(r.code).to eq(404)
  end
  
  # Test 2 - To POST to the todo with ID 1
  it "Should POST a todo with ID 1" do
    title = "Aaron"
    due_date = "1991-07-21"
    
    r = HTTParty.post url("/todos/1"),
                      query: {
                        title: title,
                        due: due_date
                      }
    expect(r.code).to eq(405)
  end
  
  # Test 3 - To POST to the todo with ID 1
  it "Should POST an empty todo with ID 1" do
       
    r = HTTParty.post url("/todos/1"),
                      query: {}
    expect(r.code).to eq(405)
  end
  
  # Test 4 - To PUT to the todo with ID 1
  it "Should PUT an empty todo with ID 1" do
       
    r = HTTParty.put url("/todos/1"),
                      query: {}
    expect(r.code).to eq(422)
  end
  
  # Test 5 - To PUT to the todo with ID 1
  it "Should PUT to todo with ID 1" do
       
   title = "Aaron"
   due_date = "1991-07-21"
    
    r = HTTParty.put url("/todos/1"),
                      query: {
                        title: title,
                        due: due_date
                      }
    expect(r.code).to eq(404)
  end
  
  # Test 6 - To DELETE the todos with ID 1
  it "Should DELETE the Todo with ID 1" do
    r = HTTParty.delete url("/todos/1"),
                      query: {}
    expect(r.code).to eq(404)
  end
end