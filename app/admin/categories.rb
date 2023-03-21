# frozen_string_literal: true

ActiveAdmin.register Category do
  remove_filter :category_courses
  permit_params :name
end
