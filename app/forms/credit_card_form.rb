# frozen_string_literal: true

class CreditCardForm < ApplicationForm
  attr_accessor :number, :date, :cvv, :name, :order_id

  validates :number, :date, :cvv, :name, presence: true
  validates :number, length: { is: Constants::CreditCard::CARD_NUMBER_LENGTH }, numericality: { only_integer: true }
  validates :name, length: { maximum: Constants::CreditCard::NAME_MAX_LENGTH },
                   format: { with: Constants::CreditCard::NAME_REGEX,
                             message: I18n.t('checkouts.partials.payment.errors.card_name') }
  validates :date, format: { with: Constants::CreditCard::DATE_REGEX,
                             message: I18n.t('checkouts.partials.payment.errors.card_date') }
  validates :cvv, length: { in: Constants::CreditCard::CVV_RANGE }, numericality: { only_integer: true }
end
