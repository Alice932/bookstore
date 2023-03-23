# frozen_string_literal: true

ActiveAdmin.register Review do
  actions :index, :show

  permit_params :title, :name, :review_text,
                :score, :status, :book_id, :user_id,
                books_attributes: %i[id title],
                user_attributes: %i[id email]

  scope :unprocessed, default: true
  scope :approved
  scope :rejected

  index do
    selectable_column
    id_column
    column :book_id
    column :title
    column :created_at
    column :user_id
    column :status
    actions
  end

  show do
    attributes_table do
      row :title
      row :name
      row :review_text
      row :score
      row :status
      row :book_id
      row :user_id
      row :created_at
      row :updated_at
    end
  end

  action_item :approve, only: :show do
    link_to t('active_admin.links.approve'), approve_admin_review_path(review), method: :put
  end

  member_action :approve, method: :put do
    resource.approved!
    redirect_to resource_path, notice: I18n.t('active_admin.notice.approved')
  end

  action_item :reject, only: :show do
    link_to t('active_admin.links.reject'), reject_admin_review_path(review), method: :put
  end

  member_action :reject, method: :put do
    resource.rejected!
    redirect_to resource_path, notice: I18n.t('active_admin.notice.rejected')
  end
end
