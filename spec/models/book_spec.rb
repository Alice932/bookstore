# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Book Model' do
  let(:valid_book) { create :book }
  let(:not_valid_book) { Book.new({ title: nil }) }

  it 'is valid' do
    expect(valid_book).to be_valid
  end

  it 'not valid' do
    expect(not_valid_book).to_not be_valid
  end
end
