# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  delegate_all

  def all_authors
    authors.map(&:display_name).join(Constants::Books::COMMA)
  end

  def truncated_all_authors
    all_authors.truncate(Constants::Books::TRUNCATED_LENGTH[:all_authors], separator: Constants::Books::SEPARATOR)
  end

  def truncated_title
    title.truncate(Constants::Books::TRUNCATED_LENGTH[:title], separator: Constants::Books::SEPARATOR)
  end
end
