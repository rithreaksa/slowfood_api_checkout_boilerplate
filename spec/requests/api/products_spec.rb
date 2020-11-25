# frozen_string_literal: true

RSpec.describe Api::ProductsController, type: :request do
  let!(:products) { 3.times { create(:product) } }

  describe 'GET /product' do
    before do
      get '/api/products'
    end

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return three products' do
      expect(JSON.parse(response.body)['products'].count).to eq 3
    end
  end
end
