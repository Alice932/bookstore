# frozen_string_literal: true

class SortBooksService
  def initialize(params)
    @category_id = params[:category_id]
    @filter = params[:filter]&.to_sym || BooksHelper::BOOK_DEFAULT_FILTER
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
    @find_books.order(BooksHelper::BOOK_FILTERS[@filter])
  end
end
