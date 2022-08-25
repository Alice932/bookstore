# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end
end
