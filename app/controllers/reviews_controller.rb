# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to @review.course, notice: t('review.notice')
    else
      redirect_to @review.course, alert: t('review.alert')
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :course_id, :score, :title, :name, :review_text)
  end
end
