# frozen_string_literal: true

class CoachDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{coach.first_name} #{coach.last_name}"
  end
end
