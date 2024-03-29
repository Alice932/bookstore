# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM

  enum status: { in_processing: 0, in_queue: 1, in_delivery: 2, delivered: 3, canceled: 4 }
  enum state: { address: 0, delivery: 1, payment: 2, confirm: 3, complete: 4 }
  belongs_to :user, optional: true
  belongs_to :delivery, optional: true

  has_one :credit_card, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items, dependent: :destroy
  has_one :coupon, dependent: :destroy

  aasm column: :state, enum: true do
    state :address, initial: true
    state :delivery
    state :payment
    state :confirm
    state :complete

    event :set_delivery do
      transitions from: :address, to: :delivery
    end

    event :set_payment do
      transitions from: :delivery, to: :payment
    end

    event :set_confirm do
      transitions from: :payment, to: :confirm
    end

    event :set_complete do
      transitions from: :confirm, to: :complete
    end
  end

  def available_delivery
    Delivery.all
  end
end
