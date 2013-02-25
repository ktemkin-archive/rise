
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
      def connected_adept_board
        devices = Adept::Device.connected_devices

        return nil if devices.empty?
        return %Q{<span class="connected">Digilent #{devices.first[:name]}</span>}
      end


    end

    #Register the helpers, for use in any classic-mode Sinatra apps.
    Sinatra.helpers AdeptDevices

  end
end


