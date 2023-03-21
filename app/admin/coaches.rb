# frozen_string_literal: true

ActiveAdmin.register Coach do
  remove_filter :coach_courses
  permit_params :first_name, :last_name, :description

  form do |f|
    f.inputs 'Details' do
      f.input :first_name
      f.input :last_name
      f.input :description
    end
    f.actions
  end
end
