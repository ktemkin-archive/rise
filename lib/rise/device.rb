
require 'rise'
require 'adept'

module Rise
  module Device
    extend self

    #
    # Programs the connected FPGA.
    #
    def program(path)

      error = Response::with_exception_handler do

        #Get a generic Adept FPGA board.
        device = Adept::Boards::GenericFPGA.new()

        #And program its FPGA.
        device.configure_fpga_with_file(path)

      end

      #Return either the error encountered, or the code for success.
      error || Response::success

    end

    #
    # Returns the usercode of the current FPGA configuration.
    #
    def configured_usercode

      response = nil

      error = Response::with_exception_handler do

        #Get a generic Adept FPGA board.
        device = Adept::Boards::GenericFPGA.new()

        #And program its FPGA.
        response = Response::success(:usercode => device.configured_usercode)

      end

      #Return either the error encountered, or the code for success.
      error || response

    end

  end
end
