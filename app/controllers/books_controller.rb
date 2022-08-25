# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all.includes(%i[author_books authors])
  end

  def new; end

  def show
    @book = Book.find(params[:id])
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end
end
