# frozen_string_literal: true

module Constants
  module Courses
    LATEST_COURSE_COUNT = 4
    NEW_COURSES_COUNT = 3
    LONGEST_ELEMENTS = 3

    INCLUDES_OPTIONS = %i[coach_courses coaches course_photos].freeze
    TRUNCATED_LENGTH = { all_coaches: 40,
                         title: 25 }.freeze
    COURSES_PER_PAGE = 12
    COURSE_DEFAULT_FILTER = :created_at_desc
    COURSE_FILTERS = {
      created_at_desc: { created_at: :desc },
      popular_asc: { created_at: :desc },
      price_asc: { price: :asc },
      price_desc: { price: :desc },
      title_asc: { title: :asc },
      title_desc: { title: :desc }
    }.freeze
    SEPARATOR = ' '
    COMMA = ', '
  end
end
