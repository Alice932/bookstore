# frozen_string_literal: true

class AddressForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :phone, :city, :country, :zip, :type, :address

  validates :first_name, length: (Constants::Address::FIRST_NAME_MIN_LENGTH..Constants::Address::FIRST_NAME_MAX_LENGTH),
                         format: { with: Constants::Address::FIRST_NAME_FORMAT,
                                   message: I18n.t('address.validations.first_name') }

  validates :last_name, length: (Constants::Address::LAST_NAME_MIN_LENGTH..Constants::Address::LAST_NAME_MAX_LENGTH),
                        format: { with: Constants::Address::LAST_NAME_FORMAT,
                                  message: I18n.t('address.validations.last_name') }

  validates :address, length: (Constants::Address::ADDRESS_MIN_LENGTH..Constants::Address::ADDRESS_MAX_LENGTH),
                      format: { with: Constants::Address::ADDRESS_FORMAT,
                                message: I18n.t('address.validations.address') }

  validates :country, length: (Constants::Address::COUNTRY_MIN_LENGTH..Constants::Address::COUNTRY_MAX_LENGTH),
                      format: { with: Constants::Address::COUNTRY_FORMAT,
                                message: I18n.t('address.validations.country') }

  validates :city, length: (Constants::Address::CITY_MIN_LENGTH..Constants::Address::CITY_MAX_LENGTH),
                   format: { with: Constants::Address::CITY_FORMAT,
                             message: I18n.t('address.validations.city') }

  validates :zip, length: (Constants::Address::ZIP_MIN_LENGTH..Constants::Address::ZIP_MAX_LENGTH),
                  format: { with: Constants::Address::ZIP_FORMAT,
                            message: I18n.t('address.validations.zip') }

  validates :phone, length: (Constants::Address::PHONE_MIN_LENGTH..Constants::Address::PHONE_MAX_LENGTH),
                    format: { with: Constants::Address::PHONE_FORMAT,
                              message: I18n.t('address.validations.phone') }

  def initialize(model, params = {})
    self.attributes = params
    @params = params
    @model = model
  end

  def save
    return unless valid?

    @model ? @model.update(@params) : @model.save
    @model
  end

  private

  def selected_country
    ISO3166::Country(@params[:country])
  end
end
