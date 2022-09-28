# frozen_string_literal: true

module Constants
  module Review
    MIN_SCORE = 0
    MAX_SCORE = 5
    SCORE_RANGE = (MIN_SCORE..MAX_SCORE)

    MAX_LENGTH_TITLE = 80
    MAX_LENGTH_TEXT = 500

    REVIEW_FORMAT = /\A[a-zA-Z0-9\s.]+\Z/
  end
end
