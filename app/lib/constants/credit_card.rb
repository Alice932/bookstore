# frozen_string_literal: true

module Constants
  module CreditCard
    CARD_NUMBER_LENGTH = 16
    NAME_MAX_LENGTH = 50
    NAME_REGEX = /\A[a-zA-Z\s]+\Z/
    DATE_REGEX = %r/\A(0[1-9]|1[0-2])\/([0-9]){2}\Z/
  end
end
