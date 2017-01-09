# QuickDSL
A quick DSL helper

# Installation
Just `require_relative` the file `dsl.rb`.

# Usage
```ruby
# Create your class
class MyClass
	# For dsl_init
	include DSL #For dsl_init
	
	# As a replacement of attr_accessor
	dsl_accessor :one, :two, :three 
	
	# Constructor
	def initialize(*args,&block)
	
    # Init the dsl thing
		dsl_init(*args,&block)
		
		# Do something
		# ...
		
	end
	
end

# Example
foo = MyClass.new do
	one 1
	two 2
	three 3
end
puts foo.one, foo.two, foo.three # Outputs 1, 2, 3
```

# Syntax

The following examples produce the same result.
```ruby
foo = MyClass.new do
  one 1
  two 2
  three 3
end
```
```ruby
foo = MyClass.new one: 1, two: 2, three: 3
```
```ruby
foo = MyClass.new
foo.one = 1
foo.two = 2
foo.three = 3
```
