# frozen_string_literal: true

ActiveAdmin.register Coupon do
  remove_filter :cart
  permit_params :code, :discount, :status

  index do
    column :id
    column :code
    column :discount
    column :status
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :code
      f.input :discount
      f.input :status
    end

    f.actions
  end
end
