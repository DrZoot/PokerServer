class TestActor
  include Nanite::Actor
  
  expose :return_array, :return_hash, :return_string, :return_time, :request_time
  
  def initialize
    # on_exception do |exc|
    #   puts "!!!!!!!!!!!!!!!!!!!!!!!!"
    #   puts "BAD THINGS HAVE HAPPENED"
    #   puts exc.inspect
    #   puts "!!!!!!!!!!!!!!!!!!!!!!!!"
    # end
    EM.start_server "0.0.0.0", 10000, TestActorEM
    
  end
  
  # TODO this works but produces garbage output when written to screen, maybe something to do with what AMQP is doing to EM, remember that AMQP is a binary protocol
  module TestActorEM
    def recieve_data(data)
      puts data.inspect
    end
  end
    
  def return_array(payload)
    ["one","two","three","four"]
  end
  
  def return_hash(payload)
    { :one => "one", :two => "two", :three => "three"}
  end
  
  def return_string(payload)
    puts payload.inspect
    "this is a string"
  end
  
  def return_time(payload)
    Time.now
  end
  
  # TODO the request doesnt seem to work, do i need to stick the return collection in a em loop and wait a bit before I try to return? is there something wrong with the mappers because they dont seem to be able to handle selectors besides :all and targeted
  
  def request_time(payload)
    request("/test_actor/return_time", ["one", "two", "three"]) do |ret|
      puts "inspecting request_time return"
      puts "=============================="
      puts ret.inspect
      puts "=============================="
    end
    puts "sent request_time after recieving payload = #{payload.inspect}"
  end
  
end