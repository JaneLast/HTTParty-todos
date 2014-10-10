require 'spec_helper'
require 'date'
require 'pry'

describe "Existing Object Todos Tests" do  
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
   get_first_id
  end
  
  after :all do
    delete_all
  end

  # Test 1 - To GET a todo from the list
  it "Should GET the todos list" do

    r = HTTParty.get url("/todos/#{@id[0]["id"]}"),
                      query: {}
    expect(r.code).to eq(200)
  end
  
   # Test 2 - To POST an empty todo to an ID
  it "Should create an empty todo item" do
     
   r = HTTParty.post url("/todos/#{@id[0]["id"]}"),
                      query: {}
                    
    expect(r.code).to eq(405)
  end
  
   # Test 3 - To POST a todo to an ID
  it "Should create an full todo item" do
    
   title = "Aaron"
   due_date = "1991-07-21" 
   r = HTTParty.post url("/todos/#{@id[0]["id"]}"),
                      query: {title: title,
                        due: due_date}
                    
    expect(r.code).to eq(405)
  end
   # Test 4 - To PUT a todo to an ID
   it "Should change a todo item" do
     
   r = HTTParty.put url("/todos/#{@id[0]["id"]}"),
                      query: {}
                    
    expect(r.code).to eq(422)
  end
  
  # Test 5 - To PUT to the todo with an ID
  it "Should PUT to todo with an ID" do
       
   title = "Aaron"
   due_date = "1991-07-21"
    
   r = HTTParty.put url("/todos/#{@id[0]["id"]}"),
                      query: {
                        title: title,
                        due: due_date
                      }
    expect(r.code).to eq(200)
  end
  
   # Test 6 - To DELETE the todos with an ID
  it "Should DELETE the Todo with an ID" do
   r = HTTParty.delete url("/todos/#{@id[0]["id"]}"),
                      query: {}
    expect(r.code).to eq(204)
  end
end
