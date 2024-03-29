# frozen_string_literal: true

module Constants
  module Books
    LATEST_BOOK_COUNT = 4
    NEW_BOOKS_COUNT = 3
    LONGEST_ELEMENTS = 3

    INCLUDES_OPTIONS = %i[author_books authors book_photos].freeze
    TRUNCATED_LENGTH = { all_authors: 40,
                         title: 25 }.freeze
    BOOKS_PER_PAGE = 12
    BOOK_DEFAULT_FILTER = :created_at_desc
    BOOK_FILTERS = {
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
