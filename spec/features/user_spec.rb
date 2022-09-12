# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authorization Page' do
  context 'with valid details' do
    let!(:user) { create :user }

    before do
      visit root_path
    end

    scenario 'redirect to registrstion path' do
      click_link 'account_dropdown'
      click_link I18n.t('header.sign_up')
      expect(current_path).to eq(new_user_registration_path)
    end

    scenario 'redirect to session path' do
      click_link 'account_dropdown'
      click_link I18n.t('header.login')
      expect(current_path).to eq(new_user_session_path)
    end

    scenario 'redirect to registrstion path' do
      click_link 'account_dropdown'
      click_link I18n.t('header.sign_up')
      expect(current_path).to eq(new_user_registration_path)
    end

    scenario 'visitor signs up succesfully' do
      visit new_user_registration_path

      fill_in 'email_field', with: 'test@test.com'
      fill_in 'password_field', with: '12345678'
      fill_in 'password_confirmation_field', with: '12345678'

      click_button I18n.t('devise.registrations.new.registration')
      expect(page).to have_text(I18n.t('devise.registrations.signed_up_but_unconfirmed'))
    end

    scenario 'visitor log in succesfully' do
      visit new_user_session_path

      fill_in 'email_field', with: user.email
      fill_in 'password_field', with: user.password

      click_button I18n.t('devise.sessions.new.login')
      expect(page).to have_text(I18n.t('devise.sessions.signed_in'))
    end

    scenario 'password recovery' do
      visit new_user_session_path

      click_link I18n.t('devise.passwords.forgot_password')

      fill_in 'email_field', with: user.email

      click_button I18n.t('devise.passwords.email_instructions')
      expect(page).to have_text("We'll email you instructions on how to reset it")
    end
  end
end
