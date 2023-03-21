# frozen_string_literal: true

class CourseDecorator < ApplicationDecorator
  delegate_all
  decorates_association :coaches, with: CoachDecorator

  def all_coaches
    coaches.map(&:full_name).join(Constants::Courses::COMMA)
  end

  def short_description
    description.truncate(100)
  end

  def truncated_all_coaches
    all_coaches.truncate(Constants::Courses::TRUNCATED_LENGTH[:all_coaches], separator: Constants::Courses::SEPARATOR)
  end

  def truncated_title
    title.truncate(Constants::Courses::TRUNCATED_LENGTH[:title], separator: Constants::Courses::SEPARATOR)
  end

  def all_categories
    categories.map(&:name).join(Constants::Courses::COMMA)
  end

  def formated_materials
    materials.split('"').max(Constants::Courses::LONGEST_ELEMENTS).join(Constants::Courses::COMMA)
  end
end
