require 'spec_helper'

describe SitemapController do
  it 'GET sitemap.xml' do
    get :index, format: :xml
    expect(response).to be_success
  end
end
