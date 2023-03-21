# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :score, numericality: { in: Constants::Review::SCORE_RANGE }
  validates :title, presence: true,
                    length: { maximum: Constants::Review::MAX_LENGTH_TITLE },
                    format: { with: Constants::Review::REVIEW_FORMAT }
  validates :name, presence: true
  validates :review_text, presence: true,
                          length: { maximum: Constants::Review::MAX_LENGTH_TEXT },
                          format: { with: Constants::Review::REVIEW_FORMAT }

  enum :status, { unprocessed: 0, approved: 1, rejected: 2 }
end
