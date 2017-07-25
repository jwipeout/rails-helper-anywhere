require 'rails_helper_anywhere/version'

class Helper
  # Makes all rails helper methods (including your custom helper methods) class methods.
  #
  # @example
  #   Helper.link_to('Home', '/') #=> '<a href="/">home page</a>'
  #   Helper.pins_path #=> '/pins'
  #   Helper.method_from_custom_helpers #=> 'return from custom method in ApplicationHelper module'

  class << self
    def helper_responders
      [
        Rails.application.routes.url_helpers,
        ActionView::Base.new('app/views'),
        ApplicationController.helpers
      ]
    end

    def method_missing(method, *args, &block)
      helper_responders.each do |helper_responder|
        return helper_responder.send(method, *args, &block) if helper_responder.respond_to?(method)
      end

      super
    end

    def respond_to_missing?(method, include_private = false)
      helper_responders.each do |helper_responder|
        return true if helper_responder.respond_to?(method, include_private)
      end

      super
    end
  end
end
