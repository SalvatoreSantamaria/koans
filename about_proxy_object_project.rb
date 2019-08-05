require File.expand_path(File.dirname(__FILE__) + '/neo')

# Project: Create a Proxy Class
#
# In this assignment, create a proxy class (one is started for you
# below).  You should be able to initialize the proxy object with any
# object.  Any messages sent to the proxy object should be forwarded
# to the target object.  As each message is sent, the proxy should
# record the name of the method sent.
#
# The proxy class is started for you.  You will need to add a method
# missing handler and any other supporting methods.  The specification
# of the Proxy class is given in the AboutProxyObjectProject koan.

###################################################################################
#https://refactoring.guru/design-patterns/proxy/ruby/example

# proxy is a structural design pattern that provides an object that 
# acts as a substitue for a real service object used by a client.
# a proxy receive cleint requests, does some work, (access control, caching, etc) 
# and then passes the request to a service object.

# the proxy object has the same interface as a service, which makes it interchangable with
# a real object when passed to a client

# USAGE EXAMPLES
# while the proxy pattern isn't a frequent guest in most Ruby applications, it's still very handy in some special cases.
# It's irreplaceable when you want to add some additional behavious to an object of some existing
# class with out changing the client code

#IDENTIFICATION
# Proxies delegate all fo the real work to some other object. Each proxy method should, in the end, refer to a
# service object unless the proxy is a subclass of a service

class Proxy
  
  attr_reader :messages
  
  def initialize(target_object) #function initialize, passing target_object in.
    @object = target_object # setting the target_object to an instance variable

    #Variables starting with @ are instance variables which are specific to the object currently holding them. 
    # Their values are different for different instances of the class. 
    # They are given their own memory space for every object created. 

    @messages = [] # initailize array
  end
  
  def called?(method_name) #function called?, passing in method_name
    @messages.include? method_name  #looking to see if messages array includes the passed in method_name
  end
  
  def number_of_times_called(method_name) #function, passing the method_name
    @messages.count method_name #counting how many times method_name is in the messages array
    # .count : With an argument, it returns the number of items matching the given value.
  end
  
  def method_missing(method_name, *args, &block) #function, passing in method_name, *args, &block
    # *args 
    #*args is using the splat operator. The splat operator means any number of arguments can be passed to the 
    # method and they will be 'splatted' into an array, like ['one', 'two', 'three']

    # &block
    # The &block is a way of sending a pice of Ruby code in to a method an then evaluating that code 
    # in the scope of that method


    if @object.respond_to? method_name then #respond_to? returns true if obj repsonds to the give method. 
      # respond_to? indicates that this should repsond with a true of false.
      #respond_to? is a method for detecting whether the class has a particular method on it.
      # so here it is checking to see if @object has the method_name on it

      # track each method called that target object can respond to in the messages array
      @messages.push method_name
      
      # call the method!
      @object.send method_name, *args
      #send sends a message to an object instance and its ancestors in class hieratchy until some method reacts (becuase
      # its name matches the first argument)

    else
      # all other cases: default behavior (raises NoMethodError)
      super method_name, *args, &block 
      # ruby uses the super keyword to call the superclass implementation of the current method. Within the body of a method,
      # calls to super acts just like a call to the original method. The search for a method body
      # starts in the superclass of the object that was found to contain the original method.
  
    end
  end
  
end




# The proxy object should pass the following Koan:
#
class AboutProxyObjectProject < Neo::Koan
  def test_proxy_method_returns_wrapped_object
    # NOTE: The Television class is defined below
    tv = Proxy.new(Television.new)

    # HINT: Proxy class is defined above, may need tweaking...

    assert tv.instance_of?(Proxy)
  end

  def test_tv_methods_still_perform_their_function
    tv = Proxy.new(Television.new)

    tv.channel = 10
    tv.power

    assert_equal 10, tv.channel
    assert tv.on?
  end

  def test_proxy_records_messages_sent_to_tv
    tv = Proxy.new(Television.new)

    tv.power
    tv.channel = 10

    assert_equal [:power, :channel=], tv.messages
  end

  def test_proxy_handles_invalid_messages
    tv = Proxy.new(Television.new)

    assert_raise(NoMethodError) do
      tv.no_such_method
    end
  end

  def test_proxy_reports_methods_have_been_called
    tv = Proxy.new(Television.new)

    tv.power
    tv.power

    assert tv.called?(:power)
    assert ! tv.called?(:channel)
  end

  def test_proxy_counts_method_calls
    tv = Proxy.new(Television.new)

    tv.power
    tv.channel = 48
    tv.power

    assert_equal 2, tv.number_of_times_called(:power)
    assert_equal 1, tv.number_of_times_called(:channel=)
    assert_equal 0, tv.number_of_times_called(:on?)
  end

  def test_proxy_can_record_more_than_just_tv_objects
    proxy = Proxy.new("Code Mash 2009")

    proxy.upcase!
    result = proxy.split

    assert_equal ["CODE", "MASH", "2009"], result
    assert_equal [:upcase!, :split], proxy.messages
  end
end


# ====================================================================
# The following code is to support the testing of the Proxy class.  No
# changes should be necessary to anything below this comment.

# Example class using in the proxy testing above.
class Television
  attr_accessor :channel

  def power
    if @power == :on
      @power = :off
    else
      @power = :on
    end
  end

  def on?
    @power == :on
  end
end

# Tests for the Television class.  All of theses tests should pass.
class TelevisionTest < Neo::Koan
  def test_it_turns_on
    tv = Television.new

    tv.power
    assert tv.on?
  end

  def test_it_also_turns_off
    tv = Television.new

    tv.power
    tv.power

    assert ! tv.on?
  end

  def test_edge_case_on_off
    tv = Television.new

    tv.power
    tv.power
    tv.power

    assert tv.on?

    tv.power

    assert ! tv.on?
  end

  def test_can_set_the_channel
    tv = Television.new

    tv.channel = 11
    assert_equal 11, tv.channel
  end
end
