require 'test_helper'

class GreetingTest < ActiveSupport::TestCase
  test "#valid?" do
    greeting = Greeting.new

    greeting.valid?

    assert greeting.errors.added?(:message, :blank), "Message is not present"
  end
end
