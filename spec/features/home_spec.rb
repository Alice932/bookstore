# frozen_string_literal: true

RSpec.describe 'Home Page' do
  context 'right text on page' do
    let!(:coach) { create :coach }

    let!(:first_course) { create :course }
    let!(:second_course) { create :course }
    let!(:third_course) { create :course }
    let!(:fourth_course) { create :course }

    let!(:first_coach_courses) { create :coach_course, course_id: first_course.id, coach_id: coach.id }
    let!(:second_coach_courses) { create :coach_course, course_id: second_course.id, coach_id: coach.id }
    let!(:third_coach_courses) { create :coach_course, course_id: third_course.id, coach_id: coach.id }
    let!(:fourth_coach_courses) { create :coach_course, course_id: fourth_course.id, coach_id: coach.id }

    before do
      visit root_path
    end

    it 'have a one course' do
      expect(page).to have_content(first_course.title)
    end

    it 'have four courses' do
      expect(page).to have_content(first_course.title)
      expect(page).to have_content(second_course.title)
      expect(page).to have_content(third_course.title)
      expect(page).to have_content(fourth_course.title)
    end

    it 'have welcome message' do
      expect(page).to have_content('Welcome to our amazing Bookstore!')
    end

    it 'have start button' do
      expect(page).to have_button('Get Started')
    end

    it 'have coach name' do
      expect(page).to have_content(coach.first_name)
    end
  end
end
