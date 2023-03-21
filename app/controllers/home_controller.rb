# frozen_string_literal: true

class HomeController < ApplicationController
  decorates_assigned :course, :courses

  def index
    @courses = Course.includes(Constants::Courses::INCLUDES_OPTIONS).limit(Constants::Courses::LATEST_COURSE_COUNT)
    unordered_courses = Course.includes(Constants::Courses::INCLUDES_OPTIONS).limit(Constants::Courses::NEW_COURSES_COUNT)
    @new_courses = unordered_courses.order(created_at: :desc)
  end
end
