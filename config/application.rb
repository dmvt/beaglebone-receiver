ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)
require "bundler/setup" if File.exists?(ENV["BUNDLE_GEMFILE"])

require "emque/consuming"
require "beaglebone"

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")

module Receiver
  class Application
    include Emque::Consuming::Application

    initialize_core!

    config.set_adapter(
      :rabbit_mq,
      :url => ENV["RABBIT_URL"],
      :prefetch => 0
    )
  end
end

