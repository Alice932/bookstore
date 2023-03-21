# frozen_string_literal: true

class SortCoursesService
  def initialize(params)
    @category_id = params[:category_id]
    @filter = params[:filter]&.to_sym || Constants::Courses::COURSE_DEFAULT_FILTER
  end

  def call
    order_by_filter
  end

  private

  def find_courses
    @find_courses ||= @category_id ? courses_with_category : courses
  end

  def courses
    Course.all.includes(Constants::Courses::INCLUDES_OPTIONS)
  end

  def courses_with_category
    Category.find_by(id: @category_id).courses.includes(Constants::Courses::INCLUDES_OPTIONS)
  end

  def order_by_filter
    find_courses.order(Constants::Courses::COURSE_FILTERS[@filter])
  end
end
