# frozen_string_literal: true

class CartBooksService
  attr_reader :cart, :params

  def initialize(cart:, params:)
    @cart = cart
    @params = params
  end

  def check_cart_book
    cart_book ? update_cart_book : create_cart_book
  end

  def cart_book
    @cart_book ||= cart.cart_books.find_by(book: params[:book_id])
  end

  def cart_book_quantity
    cart_book.quantity += params[:quantity].to_i
  end

  def more_books
    cart_book_quantity > cart_book.quantity
  end

  def update_cart_book
    return if more_books

    cart_book.quantity < Constants::Cart::QUANTITY_INCREMENT ? cart_book.delete : cart_book.save
  end

  def create_cart_book
    cart.cart_books.create(params)
  end
end
