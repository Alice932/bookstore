# frozen_string_literal: true

module Constants
  module User
    EMAIL_MINIMUM_LENGTH = 3
    EMAIL_MAXIMUM_LENGTH = 63

    PASSWORD_MINIMUM_LENGTH = 8
    PASSWORD_MAXIMUM_LENGTH = 100

    EMAIL_FORMAT = /\A([\w+].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\Z/
    PASSWORD_FORMAT = /\A^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])\S+$\Z/
  end
end
