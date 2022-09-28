# frozen_string_literal: true

class AuthorDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{author.first_name} #{author.last_name}"
  end
end
