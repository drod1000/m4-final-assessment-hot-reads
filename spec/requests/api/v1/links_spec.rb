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

    expect(response).to be_success
    expect(response.status).to eq(202)
    expect(link.read).to eq(6)
  end
end
