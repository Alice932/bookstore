# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  include Draper::LazyHelpers

  delegate_all

  TRUNCATED_LENGTH = { all_authors: 40,
                       title: 25 }.freeze

  def all_authors
    authors.map(&:name).join(', ')
  end

  def truncated_all_authors
    all_authors.truncate(TRUNCATED_LENGTH[:all_authors], separator: ' ')
  end

  def truncated_title
    title.truncate(TRUNCATED_LENGTH[:title], separator: ' ')
  end
end
