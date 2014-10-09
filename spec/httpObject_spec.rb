require 'spec_helper'
require 'date'


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
  end
  
  after :all do
    delete_all
  end

  # Test 1 - To GET a todo from the list
  it "Should GET the todos list" do

    r = HTTParty.get url("/todos/"+@ids[0].to_s),
                      query: {}
    expect(r.code).to eq(200)
  end
  
   # Test 2 - To POST a todo from the list
  it "Should create an empty todo item" do
     
   r = HTTParty.post url("/todos/"+@ids[0].to_s),
                      query: {}
    expect(r.code).to eq(405)
  end
  

  
end
