# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    # described_class.new(title: 'harry potter')
    described_class.new(title: 'harry potter', author: 'dummyAuthor', price: 5, publish_date: Time.current)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
    subject.title = 'harry potter'
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
    subject.author = 'dummyAuthor'
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
    subject.price = 5
  end

  it 'is not valid with a non-numeric price' do
    subject.price = 'hi'
    expect(subject).not_to be_valid
    subject.price = 5
  end

  it 'is not valid without a publish_date' do
    subject.publish_date = nil
    expect(subject).not_to be_valid
    subject.publish_date = Time.current
  end
end