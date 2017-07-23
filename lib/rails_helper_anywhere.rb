require "rails_helper_anywhere/version"

class Helper
  @routes = Rails.application.routes.url_helpers
  @action_view = ActionView::Base.new('app/views')
  @application_controller = ApplicationController.helpers

  class << self
    attr_reader :routes, :action_view, :application_controller

    def method_missing(method, *args, &block)
      if routes.respond_to?(method)
        routes.send(method, *args, &block)
      elsif action_view.respond_to?(method)
        action_view.send(method, *args, &block)
      elsif application_controller.respond_to?(method)
        application_controller.send(method, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      routes.respond_to?(method, include_private) ||
        action_view.respond_to?(method, include_private) ||
        super
    end
  end
end
