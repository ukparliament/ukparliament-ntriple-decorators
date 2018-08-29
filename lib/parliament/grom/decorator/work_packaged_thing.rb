module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/WorkdPackagedThing
      module WorkPackagedThing
        # Alias workPackagedThingHasWorkPackagedThingWebLink with fallback.
        #
        # @return [String, String] a web link to view the statutory instrument Grom::Node or an empty string.
        def web_link
          respond_to?(:workPackagedThingHasWorkPackagedThingWebLink) ? workPackagedThingHasWorkPackagedThingWebLink : ''
        end

        # Alias workPackagedThingHasWorkPackage with fallback.
        #
        # @return [Grom::Node, nil] a work package Grom::Node or nil.
        def work_package
          respond_to?(:workPackagedThingHasWorkPackage) ? workPackagedThingHasWorkPackage.first : nil
        end
      end
    end
  end
end
