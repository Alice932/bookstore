# frozen_string_literal: true

ActiveAdmin.register Book do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # controller do
  #   def scoped_collection
  #     AuthorBook.includes(:author)
  #   end
  # end
  remove_filter :author_books, :category_books

  permit_params :title, :description, :price, :publication_date, :materials, :dimensions,
                authors_attributes: %i[id first_name last_name],
                author_books_attributes: %i[id book_id author_id _destroy],
                categories_attributes: %i[id name],
                category_books_attributes: %i[id book_id category_id _destroy]

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :price
      f.input :publication_date
      f.input :materials
      f.input :dimensions
    end

    f.has_many :author_books, allow_destroy: true do |app_f|
      app_f.input :author
    end

    f.has_many :category_books, allow_destroy: true do |app_f|
      app_f.inputs 'Categories' do
        app_f.input :category
      end
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :price, :publication_date, :materials, :dimensions]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
