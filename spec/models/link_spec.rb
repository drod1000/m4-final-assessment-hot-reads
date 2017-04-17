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

  describe 'methods' do
    context '.top10' do
      it 'can return the top ten links by number of reads' do
        top_links_1 = create_list(:link, 5, read: 10)
        top_links_2 = create_list(:link, 5, read: 8)
        bottom_links = create_list(:link, 5, read: 5)
        top10 = Link.top10

        top_links_1.each do |link|
          assert top10.include?(link)
        end

        top_links_2.each do |link|
          assert top10.include?(link)
        end

        bottom_links.each do |link|
          refute top10.include?(link)
        end
      end
    end
  end
end
