# HTTParty Tests
This is a repo that holds the beginnings of an API test suite using RSpec and HTTParty.

## How to install

This project uses RSpec and HTTParty so you will need to install the Rubygems for them or run bundler from your cmdline:
```
bundle install
```

## How to use

To run RSpec use:
```
bundle exec rspec
```
This will run all of the tests.

The API is held at ```http://lacedeamon.spartaglobal.com/todos```
The todos are held as JSON.

## Spec_helper

The Spec_helper file contains all the workings of the project. There are 3 methods that are used. url, delete_all and create_todos.

#### URL

url is a simple method that sets the default url to lacedeamon that can have a path attached to the end. For example
```ruby
HTTParty.get url("/todos")
``` 
Would equate to
```ruby
http://lacedeamon.spartaglobal.com/todos
```

#### Delete_all

Delete_all does what it says on the tin. It deletes all the current todos in the list. You can run it before or after a test as shown in the example below.
```ruby
before :each do 
delete_all
end
```

#### Create_todos

Create_todos creates an array which holds all of the todos from a specified hash and posts them to the todos list. 

#### Project status

This is a personal project so I can learn how to use RSpec with HTTParty but if you have any questions feel free to message me @ jane.kempton@gmail.com