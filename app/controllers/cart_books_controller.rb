# frozen_string_literal: true

class CartBooksController < ApplicationController
  before_action :book_quantity, only: [:update], unless: :cart_books_service

  def create
    return redirect_to(cart_path, alert: t('cart.alert')) if cart_book_exist?

    cart_books_service
    redirect_to cart_path, notice: t('cart.notice')
  end

  def update
    redirect_to cart_path, notice: t('cart.updated')
  end

  def destroy
    CartBook.find_by(id: params[:id])&.destroy
    redirect_to cart_path, notice: t('cart.deleted')
  end

  protected

  def book_quantity_less
    redirect_to cart_path
  end

  def cart_books_service
    @cart_books_service ||= CartBooksService.new(cart: current_cart, params: cart_books_params).check_cart_book
  end

  def cart_book_exist?
    @cart_book_exist ||= current_cart.cart_books.find_by(book_id: cart_books_params[:book_id])
  end

  private

  def cart_books_params
    params.require(:cart_book).permit(:book_id, :quantity)
  end
end
