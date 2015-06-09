require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

Dir[File.join(File.dirname(__FILE__), "../factories/*.rb")].each {|f| require f }