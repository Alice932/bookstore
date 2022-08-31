# frozen_string_literal: true

class SortBooksService
  BOOK_DEFAULT_FILTER = :created_at_desc
  BOOK_FILTERS = {
    created_at_desc: { created_at: :desc },
    popular_asc: { created_at: :desc },
    price_asc: { price: :asc },
    price_desc: { price: :desc },
    title_asc: { title: :asc },
    title_desc: { title: :desc }
  }.freeze

  def initialize(params)
    @category_id = params[:category_id]
    @filter = params[:filter]&.to_sym || BOOK_DEFAULT_FILTER
  end

  def call
    find_books
    order_by_filter
  end

  private

  def find_books
    @find_books ||= if @category_id
                      Category.find_by(id: @category_id).books.includes(%i[author_books
                                                                           authors])
                    else
                      Book.all.includes(%i[
                                          author_books authors
                                        ])
                    end
  end

  def order_by_filter
    @find_books.order(BOOK_FILTERS[@filter])
  end
end
