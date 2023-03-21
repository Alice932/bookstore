# frozen_string_literal: true

RSpec.describe 'Quick Registration Part', js: true do
  describe 'right text on page' do
    let(:course) { create :course }

    describe 'when user sign out' do
      let(:user_attributes) { FactoryBot.attributes_for :user }
      before do
        visit course_path(course)
        click_button(I18n.t('courses.show.add_to_cart'))
        click_link(I18n.t('order.checkout'))
        fill_in 'quick_email_field', with: user_attributes[:email]
        click_button(I18n.t('devise.quick_registration.submit'))
      end

      it 'have created' do
        expect(page).to have_content(I18n.t('devise.quick_registration.send_password_instructions'))
        expect(page).to have_content(I18n.t('address.billing_address'))
      end
    end

    describe 'when user sign in' do
      let(:user) { create :user }
      before do
        sign_in user
        visit course_path(course)
        click_button(I18n.t('courses.show.add_to_cart'))
        click_link(I18n.t('order.checkout'))
      end

      it 'have created' do
        expect(page).to have_content(I18n.t('address.billing_address'))
      end
    end
  end
end
