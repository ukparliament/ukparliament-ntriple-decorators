require 'parliament/grom/decorator/version'
require 'parliament/grom/decorator/helpers'
require 'parliament/grom/decorator/answer'
require 'parliament/grom/decorator/answering_body'
require 'parliament/grom/decorator/answering_body_allocation'
require 'parliament/grom/decorator/article_type'
require 'parliament/grom/decorator/audience'
require 'parliament/grom/decorator/business_item'
require 'parliament/grom/decorator/collection'
require 'parliament/grom/decorator/concept'
require 'parliament/grom/decorator/constituency_area'
require 'parliament/grom/decorator/constituency_group'
require 'parliament/grom/decorator/contact_point'
require 'parliament/grom/decorator/european_region'
require 'parliament/grom/decorator/formal_body'
require 'parliament/grom/decorator/formal_body_chair'
require 'parliament/grom/decorator/formal_body_membership'
require 'parliament/grom/decorator/formal_body_type'
require 'parliament/grom/decorator/gender'
require 'parliament/grom/decorator/gender_identity'
require 'parliament/grom/decorator/government_incumbency'
require 'parliament/grom/decorator/government_position'
require 'parliament/grom/decorator/gov_register_government_organisation'
require 'parliament/grom/decorator/group'
require 'parliament/grom/decorator/house'
require 'parliament/grom/decorator/house_seat'
require 'parliament/grom/decorator/incumbency'
require 'parliament/grom/decorator/laid_thing'
require 'parliament/grom/decorator/laying'
require 'parliament/grom/decorator/laying_body'
require 'parliament/grom/decorator/member_image'
require 'parliament/grom/decorator/parliamentary_incumbency'
require 'parliament/grom/decorator/parliaments'
require 'parliament/grom/decorator/party'
require 'parliament/grom/decorator/party_membership'
require 'parliament/grom/decorator/person'
require 'parliament/grom/decorator/position'
require 'parliament/grom/decorator/postal_address'
require 'parliament/grom/decorator/procedure_route'
require 'parliament/grom/decorator/procedure_step'
require 'parliament/grom/decorator/procedure'
require 'parliament/grom/decorator/proposed_negative_statutory_instrument_paper'
require 'parliament/grom/decorator/question'
require 'parliament/grom/decorator/seat_incumbency'
require 'parliament/grom/decorator/statutory_instrument_paper'
require 'parliament/grom/decorator/opposition_incumbency'
require 'parliament/grom/decorator/opposition_position'
require 'parliament/grom/decorator/web_article'
require 'parliament/grom/decorator/work_package'
require 'parliament/grom/decorator/work_packageable_thing'
require 'parliament/grom/decorator/work_packaged_thing'

# Namespace for classes and modules that handle connections to, and processing of data from the parliamentary API.
# @since 0.1.0
module Parliament
  module Grom
    # Namespace for Grom decorators.
    #
    # @since 0.1.0
    module Decorator
      MAPPING = {
        'Answer'                                   => Answer,
        'AnsweringBody'                            => AnsweringBody,
        'AnsweringBodyAllocation'                  => AnsweringBodyAllocation,
        'ArticleType'                              => ArticleType,
        'Audience'                                 => Audience,
        'BusinessItem'                             => BusinessItem,
        'Collection'                               => Collection,
        'Concept'                                  => Concept,
        'ConstituencyArea'                         => ConstituencyArea,
        'ConstituencyGroup'                        => ConstituencyGroup,
        'ContactPoint'                             => ContactPoint,
        'EuropeanRegion'                           => EuropeanRegion,
        'FormalBodyChair'                          => FormalBodyChair,
        'FormalBodyMembership'                     => FormalBodyMembership,
        'FormalBodyType'                           => FormalBodyType,
        'FormalBody'                               => FormalBody,
        'Gender'                                   => Gender,
        'GenderIdentity'                           => GenderIdentity,
        'GovernmentIncumbency'                     => GovernmentIncumbency,
        'GovernmentPosition'                       => GovernmentPosition,
        'GovRegisterGovernmentOrganisation'        => GovRegisterGovernmentOrganisation,
        'Group'                                    => Group,
        'House'                                    => House,
        'HouseSeat'                                => HouseSeat,
        'Incumbency'                               => Incumbency,
        'LaidThing'                                => LaidThing,
        'Laying'                                   => Laying,
        'LayingBody'                               => LayingBody,
        'MemberImage'                              => MemberImage,
        'OppositionIncumbency'                     => OppositionIncumbency,
        'OppositionPosition'                       => OppositionPosition,
        'ParliamentPeriod'                         => ParliamentPeriod,
        'ParliamentaryIncumbency'                  => ParliamentaryIncumbency,
        'Party'                                    => Party,
        'PartyMembership'                          => PartyMembership,
        'Person'                                   => Person,
        'Position'                                 => Position,
        'Procedure'                                => Procedure,
        'ProcedureRoute'                           => ProcedureRoute,
        'ProcedureStep'                            => ProcedureStep,
        'ProposedNegativeStatutoryInstrumentPaper' => ProposedNegativeStatutoryInstrumentPaper,
        'PostalAddress'                            => PostalAddress,
        'Question'                                 => Question,
        'SeatIncumbency'                           => SeatIncumbency,
        'StatutoryInstrumentPaper'                 => StatutoryInstrumentPaper,
        'WebArticle'                               => WebArticle,
        'WorkPackage'                              => WorkPackage,
        'WorkPackageableThing'                     => WorkPackageableThing,
        'WorkPackagedThing'                        => WorkPackagedThing
      }.freeze

      class << self
        # Gets the root directory of the gem
        def gem_path
          File.expand_path '../../..', __dir__
        end

        def load!
          # Loads the translation file into the I18n gem
          I18n.load_path += Dir[File.join(gem_path, 'config', 'locales', '*.yml')]
          I18n.backend.load_translations
        end

        # Decorates objects with alias methods extended from decorator modules.
        # This method reads each of the `#type` values and extends the object with a decorator for that type,
        # if available.
        #
        # @param [Grom::Node] object the object to be decorated.
        # @return [Grom::Node] the object which has been decorated.
        def decorate(object)
          return object unless object.respond_to?(:type)

          Array(object.type).each do |type|
            object = decorate_with_type(object, type)
          end

          object
        end

        # Decorates objects with alias methods extended from a decorator module.
        # This method decorated an object with a module matching the type provided.
        #
        # @param [Grom::Node] object the object to be decorated.
        # @param [string] type the type we are decorating our object for/
        # @return [Grom::Node] the object which has been decorated.
        def decorate_with_type(object, type)
          decorator = MAPPING[::Grom::Helper.get_id(type)] # Get the decorator for a type, or nil
          object.extend(decorator) unless decorator.nil?

          object
        end
      end
    end
  end
end

Parliament::Grom::Decorator.load!
