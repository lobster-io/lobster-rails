module Lobster
  class Railtie < ::Rails::Railtie
    initializer 'lobster.lobster_helper' do |_app|
      ActionView::Base.include Lobster::Rails::LobsterHelper
    end
  end
end