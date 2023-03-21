# frozen_string_literal: true

ActiveAdmin.register Course do
  remove_filter :coach_courses, :category_courses
  decorate_with CourseDecorator

  permit_params :title, :description, :price, :course_photos,
                coaches_attributes: %i[id first_name last_name],
                coach_courses_attributes: %i[id course_id coach_id _destroy],
                categories_attributes: %i[id name],
                category_courses_attributes: %i[id course_id category_id _destroy],
                course_photos_attributes: %i[id course_id image]

  filter :title
  filter :coaches, as: :select,
                   collection: Coach.all.map { |a| ["#{a.first_name} #{a.last_name}", a.id] }
  filter :categories
  filter :price
  filter :publication_date
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :title
    column :description
    column :price
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.inputs :title, :description, :price
      f.has_many :course_photos do |p|
        p.hidden_field :image, value: p.object.cached_image_data
        p.input :image, as: :file
      end

      f.has_many :coach_courses, allow_destroy: true do |app_f|
        app_f.input :coach_id, as: :select, label: 'Coach', collection: Coach.all.map { |a|
                                                                            ["#{a.first_name} #{a.last_name}", a.id]
                                                                          }
      end

      f.has_many :category_courses, allow_destroy: true do |app_f|
        app_f.input :category, label: 'Category'
      end
    end

    f.actions
  end
end
