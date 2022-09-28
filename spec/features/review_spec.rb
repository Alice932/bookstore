# frozen_string_literal: true

RSpec.describe 'Review Part' do
  describe 'right text on page' do
    let!(:user) { create :user }
    let!(:author) { create :author }
    let!(:book) { create :book }
    let!(:author_books) { create :author_book, book_id: book.id, author_id: author.id }
    let!(:review_attributes) { FactoryBot.attributes_for :review }

    describe 'review' do
      before do
        sign_in user
        visit book_path(book.id)
        choose('review[score]', option: '5')
        fill_in 'name_field', with: review_attributes[:name]
        fill_in 'title_field', with: review_attributes[:title]
        fill_in 'text_review_field', with: review_attributes[:review_text]
        click_button(I18n.t('review.post_button'))
      end

      it 'have created' do
        expect(page).to have_content(I18n.t('review.notice'))
        expect(page).to have_content(review_attributes[:name])
        expect(page).to have_content(review_attributes[:review_text])
      end
    end
  end
end
