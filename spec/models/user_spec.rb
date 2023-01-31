require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'both password fields should be filled' do
      params = {
        :first_name => 'test',
        :last_name => 'test',
        :email => '123@123.com',
        :password => '1234567',
        :password_confirmation => nil,
      }
      
      @user = User.create(params)
      expect(@user.valid?).to be false
    end

    it 'must have unique email' do
      params = {
        :first_name => 'aaa',
        :last_name => 'bbb',
        :email => 'test@test.com',
        :password => '12345',
        :password_confirmation => '12345',
      }
      
      @user1 = User.create(params)
      @user2 = User.create(params)

      expect(@user2.valid?).to be false
      
    end

    it 'must have password longer than 5 characters' do
      params = {
        :first_name => 'test',
        :last_name => 'test',
        :email => 'test@test.com',
        :password => '1234',
        :password_confirmation => '1234',
      }
      
      @user = User.create(params)

      expect(@user.valid?).to be false
    end

    it 'must have password longer than 5 characters' do
      params = {
        :first_name => nil,
        :last_name => nil,
        :email => nil,
        :password => '1234',
        :password_confirmation => '1234',
      }
      
      @user = User.create(params)

      expect(@user.valid?).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should return user with correct email & password' do
      @user = User.create(
        :first_name => 'test',
        :last_name => 'test',
        :email => 'test@test.com',
        :password => 'password',
        :password_confirmation => 'password',
      )

      params = {
        :email => '  test@test.com  ',
        :password => 'password'
      }

      login = User.authenticate_with_credentials(params[:email], params[:password])

      expect(login).to be_truthy
    end

    it 'should return nil if password is incorrect' do
      @user = User.create(
        :first_name => 'test',
        :last_name => 'test',
        :email => ' tEst@Test.cOm  ',
        :password => 'password',
        :password_confirmation => 'password',
      )

      params = {
        :email => 'test@test.com',
        :password => 'pass'
      }

      login = User.authenticate_with_credentials(params[:email], params[:password])

      expect(login).to be_nil
    end
  end
end
