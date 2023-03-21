# frozen_string_literal: true

RSpec.describe 'Book Page' do
  context 'right text on page' do
    let!(:coach) { create :coach }

    let!(:first_course) { create :course }
    let!(:second_course) { create :course }

    let(:courses_count) { 2 }

    let!(:first_category) { create :category }
    let!(:second_category) { create :category }
    let!(:third_category) { create :category }

    let!(:first_coach_courses) { create :coach_course, course_id: first_course.id, coach_id: coach.id }
    let!(:second_coach_courses) { create :coach_course, course_id: second_course.id, coach_id: coach.id }

    let!(:first_category_courses) { create :category_course, course_id: first_course.id, category_id: first_category.id }
    let!(:second_category_courses) { create :category_course, course_id: second_course.id, category_id: second_category.id }

    describe 'index page' do
      let(:courses_list) { [first_course, second_course] }

      before do
        visit courses_path
      end

      it 'have a one course' do
        expect(page).to have_content(first_course.title)
      end

      it 'have names of categories' do
        expect(page).to have_content(first_category.name)
        expect(page).to have_content(second_category.name)
      end

      it 'have courses by category' do
        click_link(first_category.name)
        expect(page).to have_content(first_course.title)
        expect(page).to have_no_content(second_course.title)
      end

      it 'have not courses by empty category' do
        click_link(third_category.name)
        expect(page).to have_no_content(first_course.title)
        expect(page).to have_no_content(second_course.title)
      end

      context 'sorting' do
        it 'sort by title desc' do
          click_link('sort_list')
          click_link(I18n.t('courses.catalog.sort.title_desc'))
          expect(page).to have_content(first_course.title)
        end

        it 'displays created_at filter first' do
          courses_titles = courses_list.sort_by(&:created_at).reverse.map(&:title)
          displayed_titles = page.all('p.title').first(courses_count).map(&:text)
          expect(courses_titles).to eq displayed_titles
        end

        it 'sorts by title desc' do
          courses_titles = courses_list.map(&:title).sort.reverse
          click_link('sort_list')
          click_link(I18n.t('courses.catalog.sort.title_desc'))
          displayed_titles = page.all('p.title').first(courses_count).map(&:text)
          expect(courses_titles).to eq displayed_titles
        end

        it 'sorts by title asc' do
          courses_titles = courses_list.map(&:title).sort
          click_link('sort_list')
          click_link(I18n.t('courses.catalog.sort.title_asc'))
          displayed_titles = page.all('p.title').first(courses_count).map(&:text)
          expect(courses_titles).to eq displayed_titles
        end

        it 'sorts by price asc' do
          courses_titles = courses_list.sort_by(&:price).map(&:title)
          click_link('sort_list')
          click_link(I18n.t('courses.catalog.sort.price_asc'))
          displayed_titles = page.all('p.title').first(courses_count).map(&:text)
          expect(courses_titles).to eq displayed_titles
        end
      end
    end

    context 'with view more button' do
      let(:view_more_button) { I18n.t('courses.index.view_more') }
      let!(:courses) { create_list(:course, 20) }

      before { visit courses_path }

      it 'displays View more button if not all courses displayed' do
        expect(page).to have_content(view_more_button)
      end

      it 'disables View more button if all courses displayed' do
        find('button.btn.btn-primary').click
        expect(page).not_to have_content(I18n.t('courses.index.view_more'))
      end
    end

    describe 'show' do
      before do
        visit course_path(first_course)
      end

      it 'have a title of course' do
        expect(page).to have_content(first_course.title)
      end

      it 'have course params' do
        expect(page).to have_content(first_course.description)
        expect(page).to have_content(first_course.price)
        expect(page).to have_content(first_course.publication_date)
        expect(page).to have_content(first_course.materials)
        expect(page).to have_content(first_course.dimensions)
      end
    end
  end
end
