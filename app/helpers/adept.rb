
require 'adept'
require 'sinatra/base'

module Rise
  module Helpers

    #
    # Helper functions which allow easy rendering of information about Adept devices.
    # 
    module AdeptDevices

      #
      # Returns the name of the currently plugged-in board.
      #
      def connected_adept_board(default = 'No board connected.')
        return default if Adept::Device.connected_devices.empty?
        return "Digilent #{Adept::Device.connected_devices.first[:name]}"
      end

    end

    #Register the helpers, for use in any classic-mode Sinatra apps.
    Sinatra.helpers AdeptDevices

  end
end


