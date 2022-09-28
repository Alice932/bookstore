# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.book, notice: t('review.notice') }
      else
        format.html { redirect_to @review.book, alert: t('review.alert') }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :book_id, :score, :title, :name, :review_text)
  end
end
