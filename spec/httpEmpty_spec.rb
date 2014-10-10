require 'spec_helper'
require 'date'

describe "Empty Collection Todos Tests" do  
 
  after :all do
    delete_all
  end
  
  # Test 1 - To POST a todo with only title
  it "Should try to create a todo item with only title" do
    title = "Romeo"
   
    r = HTTParty.post url("/todos"),
                      query: {title: title}                  
    expect(r.code).to eq(422)
   end
   
  # Test 2 - To POST a todo with only a date
    it "Should try to create a todo item with only date" do
    due_date = "2014-09-10-"
   
    r = HTTParty.post url("/todos"),
                      query: {due: due_date}                  
    expect(r.code).to eq(422)
   end
   
  # Test 3 - To POST a correct item 
  it "Should create a todo item" do
    title = "Romeo"
    due_date = "2014-09-10"
    
    r = HTTParty.post url("/todos"),
                      query: {
                        title: title,
                        due: due_date
                      }
    expect(r.code).to eq(201)
    expect(r["title"]).to eq(title)
    expect(r["due"]).to eq(due_date)
  end
  
  # Test 4 - To POST an empty todo 
  it "Should create an empty todo item" do
     
    r = HTTParty.post url("/todos"),
                      query: {}
    expect(r.code).to eq(422)
  end
  
  # Test 5 - To GET the empty todos list
  it "Should GET the todos list" do
    r = HTTParty.get url("/todos"),
                      query: {}
    expect(r.code).to eq(200)
  end
  
  # Test 6 - To PUT to the empty todos list
  it "Should PUT to the todos list" do
    r = HTTParty.put url("/todos"),
                      query: {}
    expect(r.code).to eq(405)
  end
  # Test 7 - To DELETE the empty todos list
  it "Should DELETE the todos list" do
    r = HTTParty.delete url("/todos"),
                      query: {}
    expect(r.code).to eq(405)
  end
end  
