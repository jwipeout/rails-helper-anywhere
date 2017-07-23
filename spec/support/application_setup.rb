require 'rails/all'

class Application < Rails::Application
end

Rails.application.routes.draw do
  resources :pins
end

module ApplicationHelper
  def from_app_helper
    'Method in application helper'
  end
end

ActionView::Base.include(ApplicationHelper)

class ApplicationController < ActionController::Base
end
