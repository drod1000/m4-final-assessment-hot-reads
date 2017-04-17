require 'rails_helper'

describe "Links API" do
  it "can create a link" do
    post '/api/v1/links', :url => 'http://someurl.com'

    expect(response).to be_success
    expect(response.status).to eq(201)
    expect(Link.count).to eq(1)
  end
end
