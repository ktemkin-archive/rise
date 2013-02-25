
require 'ise'
require 'sinatra/base'

module Rise
  module Helpers

    #
    # Helper functions which allow easy rendering of information about Adept devices.
    # 
    module ISEHelpers

      def most_recent_bit_file
        project =  ISE::ProjectNavigator::most_recent_project 
        return '' if project.nil?

        (project.bit_file.nil?) ? '' : project.bit_file 
      end

    end

    #Register the helpers, for use in any classic-mode Sinatra apps.
    Sinatra.helpers ISEHelpers

  end
end


