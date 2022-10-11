# frozen_string_literal: true

ActiveAdmin.register Book do
  remove_filter :author_books, :category_books
  decorate_with BookDecorator

  permit_params :title, :description, :price, :publication_date, :materials, :dimensions, :book_photos,
                authors_attributes: %i[id first_name last_name],
                author_books_attributes: %i[id book_id author_id _destroy],
                categories_attributes: %i[id name],
                category_books_attributes: %i[id book_id category_id _destroy],
                book_photos_attributes: %i[id book_id image]

  filter :title
  filter :authors, as: :select,
                   collection: Author.all.map { |a| ["#{a.first_name} #{a.last_name}", a.id] }
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
      f.inputs :title, :description, :price, :publication_date, :dimensions, :materials
      f.has_many :book_photos do |p|
        p.hidden_field :image, value: p.object.cached_image_data
        p.input :image, as: :file
      end

      f.has_many :author_books, allow_destroy: true do |app_f|
        app_f.input :author_id, as: :select, label: 'Author', collection: Author.all.map { |a|
                                                                            ["#{a.first_name} #{a.last_name}", a.id]
                                                                          }
      end

      f.has_many :category_books, allow_destroy: true do |app_f|
        app_f.input :category, label: 'Category'
      end
    end

    f.actions
  end
end
