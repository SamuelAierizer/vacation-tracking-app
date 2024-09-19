# frozen_string_literal: true

class Card < ViewComponent::Base
  renders_one :title
  renders_one :subtitle
  renders_one :body
  renders_one :footer

  def initialize(container_class = "")
    @container_class = container_class
  end
end
