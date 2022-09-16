# frozen_string_literal: true

class UserForm
  include ActiveModel::Model
  attr_accessor :email, :current_password, :password, :password_confirmation, :type

  validates :email, length: (Constants::User::EMAIL_MINIMUM_LENGTH..Constants::User::EMAIL_MAXIMUM_LENGTH),
                    format: { with: Constants::User::EMAIL_FORMAT,
                              message: I18n.t('privacy.validations.email') },
                    if: :params_email?

  validates :current_password, :password, :password_confirmation, presence: true, if: :params_password?

  validates :password, length: (Constants::User::PASSWORD_MINIMUM_LENGTH..Constants::User::PASSWORD_MAXIMUM_LENGTH),
                       format: { with: Constants::User::PASSWORD_FORMAT,
                                 message: I18n.t('privacy.validations.password') },
                       if: :params_password? && :password_attributes_not_blank

  validate :password_validation, if: :params_password? && :password_attributes_not_blank

  def initialize(model, params = {})
    self.attributes = params
    @params = params
    @model = model
  end

  def save
    return unless valid?

    @params[:email].present? ? @model.update(email: @params[:email]) : @model.update(password: @params[:password])
    @model
  end

  private

  def params_email?
    @params[:type] == I18n.t('privacy.type.email')
  end

  def params_password?
    @params[:type] == I18n.t('privacy.type.password')
  end

  def password_validation
    return if password == password_confirmation

    errors.add(:password_confirmation, I18n.t('privacy.validation.password_confirmation'))
  end

  def password_attributes_not_blank
    current_password.present? && password.present? && password_confirmation.present?
  end
end
