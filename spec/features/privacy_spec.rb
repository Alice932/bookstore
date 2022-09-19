# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Edit Page' do
  context 'with valid details' do
    let!(:user) { create :user }
    let(:old_password) { '12345678' }
    let(:new_password) { 'Create123' }
    let(:new_email) { 'some@test.com' }

    before do
      sign_in user
      visit edit_user_path(user)
    end

    context 'password update' do
      before do
        fill_in 'old_password_field', with: old_password
        fill_in 'password_field', with: new_password
        fill_in 'confirm_password_field', with: new_password
        click_button(I18n.t('privacy.button_submit_password'))
        visit new_user_session_path
        fill_in 'email_field', with: user.email
        fill_in 'password_field', with: new_password
        click_button(I18n.t('devise.sessions.new.login'))
      end

      it 'password updated' do
        expect(page).to have_text(I18n.t('devise.sessions.signed_in'))
      end
    end

    context 'email update' do
      before do
        fill_in 'email_field', with: new_email
        click_button(I18n.t('privacy.button_submit'))
      end

      it 'password updated' do
        expect(page).to have_current_path(root_path)
      end
    end

    context 'delete account' do
      before do
        find('.checkbox-input', visible: false).set(true)
        find_button(I18n.t('privacy.btn_remove_account')).click
      end

      it 'account deleted' do
        expect(page).to have_current_path(root_path)
      end
    end
  end
end
