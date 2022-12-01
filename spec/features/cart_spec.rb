# frozen_string_literal: true

RSpec.describe 'Cart Part', js: true do
  describe 'right text on page' do
    let!(:user) { create :user }
    let!(:coupon) { create :coupon, status: 0 }
    let!(:used_coupon) { create :coupon, status: 1 }
    let(:book) { create :book }
    let(:order) { create :order, user_id: user.id }
    let(:order_item) { create :order_item, order_id: order.id, book_id: book.id }
    let(:total) { book.price * coupon.discount / Constants::Coupon::MAX_DISCOUNT }

    describe 'user signed in' do
      before do
        sign_in user
        visit book_path(book)
        click_button(I18n.t('books.show.add_to_cart'))
      end

      context 'add book to order' do
        it { expect(page).to have_content(I18n.t('order.notice')) }
      end

      context 'delete from order' do
        before do
          find('.close.general-cart-close').click
        end
        it { expect(page).to have_content(I18n.t('order.deleted')) }
      end

      context 'clear order' do
        before do
          sign_out user
          visit cart_path
        end

        it { expect(page).to have_content(I18n.t('order.empty_cart')) }
      end

      describe 'coupon part' do
        context 'use active coupon' do
          before do
            fill_in 'coupon_code', with: coupon.code
            click_button(I18n.t('coupon.submit'))
          end

          it { expect(page).to have_content(I18n.t('coupon.valid')) }
          it { expect(page).to have_content(total) }
        end

        context 'use used coupon' do
          before do
            fill_in 'coupon_code', with: used_coupon.code
            click_button(I18n.t('coupon.submit'))
          end

          it { expect(page).to have_content(I18n.t('coupon.invalid')) }
        end
      end
    end

    describe 'user not signed in' do
      before do
        visit book_path(book)
        click_button(I18n.t('books.show.add_to_cart'))
      end

      context 'add book to order' do
        it { expect(page).to have_content(I18n.t('order.notice')) }
      end

      context 'delete from order' do
        before do
          find('.close.general-cart-close').click
        end
        it { expect(page).to have_content(I18n.t('order.deleted')) }
      end

      context 'login with order' do
        before do
          sign_in user
          visit cart_path
        end

        it { expect(page).to have_content(book.title) }
      end

      describe 'coupon part' do
        context 'use active coupon' do
          before do
            fill_in 'coupon_code', with: coupon.code
            click_button(I18n.t('coupon.submit'))
          end

          it { expect(page).to have_content(I18n.t('coupon.valid')) }
          it { expect(page).to have_content(total) }
        end

        context 'use used coupon' do
          before do
            fill_in 'coupon_code', with: used_coupon.code
            click_button(I18n.t('coupon.submit'))
          end

          it { expect(page).to have_content(I18n.t('coupon.invalid')) }
        end
      end

      describe 'quantity part' do
        context 'plus link' do
          before do
            first('.plus-link').click
          end

          it { expect(page).to have_content(I18n.t('order.updated')) }
        end
        context 'minus link' do
          before do
            first('.minus-link').click
          end

          it { expect(page).to have_content(I18n.t('order.updated')) }
        end
      end
    end
  end
end
