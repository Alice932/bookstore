# frozen_string_literal: true

RSpec.describe 'Cart Part', js: true do
  describe 'right text on page' do
    let!(:user) { create :user }
    let!(:coupon) { create :coupon, status: 0 }
    let!(:used_coupon) { create :coupon, status: 1 }
    let(:book) { create :book }
    let(:cart) { create :cart, user_id: user.id }
    let(:cart_item) { create :cart_item, cart_id: cart.id, book_id: book.id }
    let(:total) { book.price * coupon.discount / Constants::Coupon::MAX_DISCOUNT }

    describe 'user signed in' do
      before do
        sign_in user
        visit book_path(book)
        click_button(I18n.t('books.show.add_to_cart'))
      end

      context 'add book to cart' do
        it { expect(page).to have_content(I18n.t('cart.notice')) }
      end

      context 'delete from cart' do
        before do
          find('.close.general-cart-close').click
        end
        it { expect(page).to have_content(I18n.t('cart.deleted')) }
      end

      context 'clear cart' do
        before do
          sign_out user
          visit cart_path
        end

        it { expect(page).to have_content(I18n.t('cart.empty_cart')) }
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

      context 'add book to cart' do
        it { expect(page).to have_content(I18n.t('cart.notice')) }
      end

      context 'delete from cart' do
        before do
          find('.close.general-cart-close').click
        end
        it { expect(page).to have_content(I18n.t('cart.deleted')) }
      end

      context 'login with cart' do
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
    end
  end
end
