=begin
#Selling Partner API for Solicitations

#With the Solicitations API you can build applications that send non-critical solicitations to buyers. You can get a list of solicitation types that are available for an order that you specify, then call an operation that sends a solicitation to the buyer for that order. Buyers cannot respond to solicitations sent by this API, and these solicitations do not appear in the Messaging section of Seller Central or in the recipient's Message Center. The Solicitations API returns responses that are formed according to the <a href=https://tools.ietf.org/html/draft-kelly-json-hal-08>JSON Hypertext Application Language</a> (HAL) standard.

OpenAPI spec version: v1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.24
=end

# Common files
require 'GEMNAME/api_client'
require 'GEMNAME/api_error'
require 'GEMNAME/version'
require 'GEMNAME/configuration'

# Models
require 'GEMNAME/models/create_product_review_and_seller_feedback_solicitation_response'
require 'GEMNAME/models/error'
require 'GEMNAME/models/error_list'
require 'GEMNAME/models/get_schema_response'
require 'GEMNAME/models/get_schema_response__links'
require 'GEMNAME/models/get_solicitation_action_response'
require 'GEMNAME/models/get_solicitation_action_response__embedded'
require 'GEMNAME/models/get_solicitation_action_response__links'
require 'GEMNAME/models/get_solicitation_actions_for_order_response'
require 'GEMNAME/models/get_solicitation_actions_for_order_response__embedded'
require 'GEMNAME/models/get_solicitation_actions_for_order_response__links'
require 'GEMNAME/models/link_object'
require 'GEMNAME/models/schema'
require 'GEMNAME/models/solicitations_action'

# APIs
require 'GEMNAME/api/solicitations_api'

module AmzSpApi::MODULENAME
  class << self
    # Customize default settings for the SDK using block.
    #   AmzSpApi::MODULENAME.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
