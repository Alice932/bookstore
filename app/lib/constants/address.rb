# frozen_string_literal: true

module Constants
  module Address
    FIRST_NAME_MIN_LENGTH = 3
    FIRST_NAME_MAX_LENGTH = 50

    LAST_NAME_MIN_LENGTH = 3
    LAST_NAME_MAX_LENGTH = 50

    ADDRESS_MIN_LENGTH = 3
    ADDRESS_MAX_LENGTH = 50

    COUNTRY_MIN_LENGTH = 1
    COUNTRY_MAX_LENGTH = 25

    CITY_MIN_LENGTH = 3
    CITY_MAX_LENGTH = 50

    ZIP_MIN_LENGTH = 5
    ZIP_MAX_LENGTH = 10

    PHONE_MIN_LENGTH = 10
    PHONE_MAX_LENGTH = 15

    FIRST_NAME_FORMAT = /\A[a-zA-z]+\Z/
    LAST_NAME_FORMAT = /\A[a-zA-z]+\Z/
    ADDRESS_FORMAT = /\A[a-zA-Z0-9\-,\s]+\Z/
    COUNTRY_FORMAT = /\A[a-zA-z]+\Z/
    CITY_FORMAT = /\A[a-zA-Z]+(?:[\s-][a-zA-Z]+)*\Z/
    ZIP_FORMAT = /\A[0-9-]+\Z/
    PHONE_FORMAT = /\A\+[0-9]+\Z/
  end
end
