require 'rise'
require 'json'

module Rise
  module Response
    extend self

    #
    # Sends a JSON failure message.
    #
    def failure(message, trace=nil, &block)
      JSON::generate({success: false, message: message, trace: trace})
    end

    #
    # Sends a JSON sucess message.
    #
    def success(object = {})

      #If we have a string, wrap it in an object.
      object = {message: object} if object.is_a? String

      #Add the sucesss flag to the provided object.
      object[:success] = true

      #Wrap the object in a JSON wrapper, and return it.
      JSON::generate(object)
    end

    #
    # Automatically converts all exceptions to JSON error summaries.
    #
    def with_exception_handler
      begin
        yield
        return nil
      rescue Exception => e
        failure e.message, e.backtrace
      end
    end

    private

    def generate(object)

    end

  end
end
