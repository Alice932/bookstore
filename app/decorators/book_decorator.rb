# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  delegate_all

  TRUNCATED_LENGTH = { all_authors: 40,
                       title: 25 }.freeze

  def all_authors
    authors.map(&:name).join(Constants::Books::COMMA)
  end

  def truncated_all_authors
    all_authors.truncate(TRUNCATED_LENGTH[:all_authors], separator: Constants::Books::SEPARATOR)
  end

  def truncated_title
    title.truncate(TRUNCATED_LENGTH[:title], separator: Constants::Books::SEPARATOR)
  end
end
