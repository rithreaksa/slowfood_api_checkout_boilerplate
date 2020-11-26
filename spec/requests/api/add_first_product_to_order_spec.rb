RSpec.describe 'POST /api/orders',type: :request do
  let!(:product_to_add_to_order) { create(:product)}
  let!(:registered_user) { create(:user)}
  let!(:authorization_headers) { registered_user.create_new_auth_token} # this 'create_new_auth_token' method is provided by devise_token_auth

  describe 'with a valid product id' do
    before do
      post 'api/orders',
        params: {product_id: product_to_add_to_order.id},
        headers: authorization_headers
    end
  
    it {
      expect(response).to have_http_status 201
    }
    
  end

  
end