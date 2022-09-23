# frozen_string_literal: true

ActiveAdmin.register Category do
  remove_filter :category_books
  permit_params :name
end
