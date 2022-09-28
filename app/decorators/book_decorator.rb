# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  delegate_all
  decorates_association :authors, with: AuthorDecorator

  def all_authors
    authors.map(&:full_name).join(Constants::Books::COMMA)
  end

  def truncated_all_authors
    all_authors.truncate(Constants::Books::TRUNCATED_LENGTH[:all_authors], separator: Constants::Books::SEPARATOR)
  end

  def truncated_title
    title.truncate(Constants::Books::TRUNCATED_LENGTH[:title], separator: Constants::Books::SEPARATOR)
  end

  def all_categories
    categories.map(&:name).join(Constants::Books::COMMA)
  end
end
