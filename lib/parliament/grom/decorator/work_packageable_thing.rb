module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/WorkPackageableThing
      module WorkPackageableThing
        # Alias workPackageableThingName with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:workPackageableThingName) ? workPackageableThingName : ''
        end

        # Alias workPackageableThingHasWorkPackage with fallback.
        # NB: Currently, a work packageable thing only has one work package
        #
        # @return [Grom::Node, nil] a WorkPackage Grom::Node or nil.
        def work_package
          respond_to?(:workPackageableThingHasWorkPackage) ? workPackageableThingHasWorkPackage.first : nil
        end

        # Alias workPackageableThingHasWorkPackage with fallback.
        #
        # @return [String, String] a web link or an empty string.
        def weblink
          respond_to?(:workPackageableThingHasWorkPackageableThingWebLink) ? workPackageableThingHasWorkPackageableThingWebLink : ''
        end

        # Uses work_package method in this set of decorators, which could return nil.
        # Uses business_items method in WorkPackage decorators, which could return an empty array.
        #
        # @return [Boolean] whether a work packageable thing has both a work package and some business items.
        def work_package_and_business_items?
          work_package ? work_package.business_items.any? : false
        end

        # @return [Grom::Node, nil] a BusinessItem Grom::Node or nil.
        def oldest_business_item
          work_package_and_business_items? ? work_package.business_items.sort_by(&:date).last : nil
        end

        # @return [Date, nil] an array of BusinessItem Grom::Nodes or an empty array.
        def oldest_business_item_date
          oldest_business_item&.date
        end

        # Alias workPackageableThingComingIntoForceDate with fallback.
        #
        # @return [DateTime, nil] the expiry date (time limit) of a work package or nil.
        def time_limit_for_objection_date
          respond_to?(:workPackageableThingTimeLimitForObjectionEndDate) ? DateTime.parse(workPackageableThingTimeLimitForObjectionEndDate) : nil
        end
      end
    end
  end
end
