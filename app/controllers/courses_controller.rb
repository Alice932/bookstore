# frozen_string_literal: true

class CoursesController < ApplicationController
  include Pagy::Backend

  decorates_assigned :course, :courses

  def index
    @courses_count = Course.all.count
    @pagy, @courses = pagy_countless(scoped_courses, items: Constants::Courses::COURSES_PER_PAGE)
    @categories = Category.all

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @filters = Constants::Courses::COURSE_FILTERS
    @course = Course.find(params[:id])
    @review = Review.new
  end

  private

  def scoped_courses
    SortCoursesService.new(params).call
  end
end
