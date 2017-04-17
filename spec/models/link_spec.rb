require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a url' do
        link = Link.new

        expect(link).to be_invalid
      end

      it 'url must be valid url' do
        link = Link.new(url: 'noturl')

        expect(link).to be_invalid
      end

      it 'url must be unique' do
        link = Link.create(url: 'http://someurl.com')
        link_2 = Link.create(url: 'http://someurl.com')

        expect(link_2).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with all attributes' do
        link = Link.create(url: 'http://someurl.com')

        expect(link).to be_valid
      end

      it 'read is 1 by default' do
        link = Link.create(url: 'http://someurl.com')

        expect(link.read).to eq(1)
      end
    end
  end
end
