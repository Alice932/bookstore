# frozen_string_literal: true

describe 'Admin page', js: true do
  let!(:admin) { create :admin_user }

  subject do
    visit new_admin_user_session_path
    fill_in 'admin_user_email', with: admin.email
    fill_in 'admin_user_password', with: admin.password
    find_button(I18n.t('active_admin.login')).click
  end

  describe 'Author' do
    let!(:coach) { create :coach }
    let(:coach_attributes) { FactoryBot.attributes_for(:coach) }

    before do
      subject
    end

    it { expect(page).to have_content(I18n.t('active_admin.sign_in')) }

    context 'creates coach' do
      before do
        visit admin_coachs_path
        click_link I18n.t('active_admin.new_model', model: 'Author')
        fill_in 'coach_first_name', with: coach_attributes[:first_name]
        fill_in 'coach_last_name', with: coach_attributes[:last_name]
        fill_in 'coach_description', with: coach_attributes[:description]
        find_button(I18n.t('active_admin.create_model', model: 'Author')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Author')) }
    end

    context 'edit coach' do
      before do
        visit edit_admin_coach_path(coach.id)
        fill_in 'coach_first_name', with: coach_attributes[:first_name]
        find_button(I18n.t('active_admin.update_model', model: 'Author')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Author')) }
    end

    context 'delete coach' do
      before do
        visit admin_coach_path(coach.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Author')).click
        accept_alert
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Author')) }
    end
  end

  describe 'Book' do
    let!(:course) { create :course }
    let(:course_attributes) { FactoryBot.attributes_for(:course) }

    before do
      subject
    end

    context 'create course' do
      before do
        visit admin_courses_path
        click_link I18n.t('active_admin.new_model', model: 'Book')
        fill_in 'course_title', with: course_attributes[:title]
        fill_in 'course_description', with: course_attributes[:description]
        fill_in 'course_price', with: course_attributes[:price]
        fill_in 'course_publication_date', with: course_attributes[:publication_date]
        fill_in 'course_materials', with: course_attributes[:materials]
        fill_in 'course_dimensions', with: course_attributes[:dimensions].first
        find_button(I18n.t('active_admin.create_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Book')) }
    end

    context 'attach photo' do
      before do
        visit edit_admin_course_path(course.id)
        find_link(I18n.t('active_admin.add_photo')).click
        page.attach_file('course_course_photos_attributes_0_image', "#{Rails.root}/spec/fixtures/images/test.jpg")
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Book')) }
    end

    context 'attach unvalid file' do
      before do
        visit edit_admin_course_path(course.id)
        find_link(I18n.t('active_admin.add_photo')).click
        page.attach_file('course_course_photos_attributes_0_image', "#{Rails.root}/spec/fixtures/texts/test.txt")
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.unvalid_file')) }
    end

    context 'attach coach' do
      let!(:coach) { create :coach }
      before do
        visit edit_admin_course_path(course.id)
        find_link(I18n.t('active_admin.add_coach')).click
        select "#{coach.first_name} #{coach.last_name}", from: 'course_coach_courses_attributes_0_coach_id'
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Book')) }
    end

    context 'attach category' do
      let!(:category) { create :category }
      before do
        visit edit_admin_course_path(course.id)
        find_link(I18n.t('active_admin.add_category')).click
        select category.name, from: 'course_category_courses_attributes_0_category_id'
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Book')) }
    end

    context 'edit course' do
      before do
        visit edit_admin_course_path(course.id)
        fill_in 'course_title', with: course_attributes[:title]
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Book')) }
    end

    context 'delete course' do
      before do
        visit admin_course_path(course.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Book')).click
        accept_alert
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Book')) }
    end
  end

  describe 'Category' do
    let!(:category) { create :category }
    let(:category_attributes) { FactoryBot.attributes_for(:category) }

    before do
      subject
    end

    context 'create category' do
      before do
        visit admin_categories_path
        click_link I18n.t('active_admin.new_model', model: 'Category')
        fill_in 'category_name', with: category_attributes[:name]
        find_button(I18n.t('active_admin.create_model', model: 'Category')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Category')) }
    end

    context 'edit category' do
      before do
        visit edit_admin_category_path(category.id)
        fill_in 'category_name', with: category_attributes[:name]
        find_button(I18n.t('active_admin.update_model', model: 'Category')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Category')) }
    end

    context 'delete category' do
      before do
        visit admin_category_path(category.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Category')).click
        accept_alert
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Category')) }
    end
  end

  describe 'Review' do
    let!(:course) { create :course }
    let!(:user) { create :user }
    let!(:review) { create :review, course_id: course.id, user_id: user.id }

    before do
      subject
      visit admin_reviews_path
    end

    it 'have review params' do
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.status)
    end

    context 'approved review' do
      before do
        visit admin_review_path(review.id)
        find_link(I18n.t('active_admin.approve_button')).click
        visit course_path(course.id)
      end

      it { expect(page).to have_content(I18n.t('review.verified')) }
    end
  end

  describe 'Coupon' do
    let!(:course) { create :course }
    let!(:user) { create :user }
    let!(:coupon) { create :coupon }
    let(:coupon_attributes) { FactoryBot.attributes_for(:coupon) }

    before do
      subject
      visit admin_coupons_path
    end

    it 'have review params' do
      expect(page).to have_content(coupon.code)
      expect(page).to have_content(coupon.discount)
      expect(page).to have_content(coupon.status)
    end

    context 'create coupon' do
      before do
        click_link I18n.t('active_admin.new_model', model: 'Coupon')
        fill_in 'coupon_code', with: coupon_attributes[:code]
        fill_in 'coupon_discount', with: coupon_attributes[:discount]
        find_button(I18n.t('active_admin.create_model', model: 'Coupon')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Coupon')) }
    end

    context 'edit coupon' do
      before do
        visit edit_admin_coupon_path(coupon.id)
        fill_in 'coupon_discount', with: coupon_attributes[:discount]
        find_button(I18n.t('active_admin.update_model', model: 'Coupon')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Coupon')) }
    end

    context 'delete coupon' do
      before do
        visit admin_coupon_path(coupon.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Coupon')).click
        accept_alert
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Coupon')) }
    end
  end
end
