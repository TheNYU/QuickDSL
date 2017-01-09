#!/bin/env ruby
# encoding: utf-8
# ---
# A quick DSL helper
# NYU - GNU 
# 2017

class Module

	def alias_attribute(new_name, old_name)
	    module_eval <<-STR, __FILE__, __LINE__ + 1
	      def #{new_name}; self.#{old_name}; end          # def subject; self.title; end
	      def #{new_name}=(v); self.#{old_name} = v; end  # def subject=(v); self.title = v; end
	    STR
 	end

 	def dsl_accessor(*args)
 		args.each { |arg| 
 			module_eval <<-STR, __FILE__, __LINE__ + 1
 				@#{arg} = nil
 				def #{arg}(v=nil) ; (v === nil) ? @#{arg} : @#{arg} = v ; end
 				def #{arg}=(v) ; @#{arg} = v ; end
 			STR
 		}
 	end

 	def dsl_writer(*args)
 		args.each { |arg| 
 			module_eval <<-STR, __FILE__, __LINE__ + 1
 				@#{arg} = nil
 				def #{arg}(v) ; @#{arg} = v ; end
 				def #{arg}=(v) ; @#{arg} = v ; end
 			STR
 		}
 	end

 	def dsl_reader(*args)
 		args.each { |arg| 
 			module_eval <<-STR, __FILE__, __LINE__ + 1
 				@#{arg} = nil
 				def #{arg}(v=nil) ; (v === nil) ? @#{arg} : @#{arg} = v ; end
 			STR
 		}
 	end
  
end

module DSL

	def dsl_init(*args,&block)
		if args.length == 1 && args[0].is_a?(Hash)
			args[0].each { |k,v|
				send(k,v) if respond_to?(k)
			}
		end
		instance_eval(&block) if block_given?
	end

end
