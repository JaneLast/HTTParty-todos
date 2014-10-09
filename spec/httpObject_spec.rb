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
  end
  
  after :all do
    delete_all
  end

  # Test 1 - To GET a todo from the list
  it "Should GET the todos list" do
    binding.pry
    r = HTTParty.get url("/todos/" + ("id")),
                      query: {}
    expect(r.code).to eq(200)
  end
end