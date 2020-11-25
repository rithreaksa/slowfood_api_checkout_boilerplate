
RSpec.describe User, type: :model do
  describe 'Products has db columns' do
    it  { is_expected.to have_db_column :id }
    it  { is_expected.to have_db_column :email }
    it  { is_expected.to have_db_column :encrypted_password }
  end

  describe 'Factory' do
    it 'is expected to have valid Factory' do
      expect(create(:user)).to be_valid
    end
  end
end
