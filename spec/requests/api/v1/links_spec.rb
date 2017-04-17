require 'rails_helper'

describe 'Links API' do
  it 'can create a link' do
    post '/api/v1/links', :url => 'http://someurl.com'

    expect(response).to be_success
    expect(response.status).to eq(201)
    expect(Link.count).to eq(1)
  end

  it 'can increment count if link already exists' do
    link = create(:link, url: 'http://someurl.com', read: 5)

    post '/api/v1/links', :url => 'http://someurl.com'

    updated_link = Link.find_by(url: 'http://someurl.com')
    expect(response).to be_success
    expect(response.status).to eq(202)
    expect(updated_link.read).to eq(6)
  end

  it 'can return top 10 links' do
    create_list(:link, 5, read: 10)
    create_list(:link, 5, read: 8)
    create_list(:link, 5, read: 5)

    get '/api/v1/links'

    expect(response).to be_success
    expect(response.status).to eq(200)

    links = JSON.parse(response.body)

    expect(links.count).to eq(10)
    
    link = links.first

    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key("url")
    expect(invoice).to have_key("read")
  end
end
