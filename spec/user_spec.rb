require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'save required validations' do
      @user = User.new({
        name:  'Luke',
        email: 'luke@luke.com',
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      expect(@user.save).to be true
    end

    it 'should not save user due to unmatched passwords' do
      @user = User.new({
        name:  'Luke',
        email: 'luke@luke.com',
        password: 'chewy',
        password_confirmation: 'chewbacca'
      })

      expect(@user.save).to be false
    end

    it 'should not save user due to existing email' do
      @user1 = User.new({
        name:  'Luke',
        email: 'lukeluke@luke.COM',
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      expect(@user1.save).to be true
      @user2 = User.new({
        name:  'Luke',
        email: 'lukeluke@luke.com',
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      expect(@user2.save).to be false
    end

    it 'should not save user due to missing name' do
      @user = User.new({
        name:  nil,
        email: 'Luke@luke.com',
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save user due to missing email' do
      @user = User.new({
        name:  'luke',
        email: nil,
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not save user due to missing password' do
      @user = User.new({
        name:  'luke',
        email: 'Luke@luke.com',
        password: nil,
        password_confirmation: 'chewbacca'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not save user due password length' do
      @user = User.new({
        name:  'luke',
        email: 'lukeluke@luke.com',
        password: 'ch',
        password_confirmation: 'ch'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end

  describe 'authenticate_with_credentials' do

    it 'should return an instance of the user if authenticated' do

      @user = User.new({
        name:  'luke',
        email: 'lukeluke@luke.com',
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      @user.save
      @authenticated_user = User.authenticate_with_credentials('lukeluke@luke.com', 'chewbacca')

      expect(@authenticated_user).to be_present
    end

    it 'should not return an instance of the user if authentication fails' do

      @user = User.new({
        name:  'luke',
        email: 'lukeluke@luke.com',
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      @user.save
      @authenticated_user = User.authenticate_with_credentials('lukeluke@luke.com', 'wrong password')

      expect(@authenticated_user).to be_nil
    end

    it 'should return an instance of the user even if there are extra spaces in the email' do

      @user = User.new({
        name:  'luke',
        email: 'lukeluke@luke.com',
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      @user.save
      @authenticated_user = User.authenticate_with_credentials(' lukeluke@luke.com ', 'chewbacca')

      expect(@authenticated_user).to be_present
    end

    it 'should return an instance of the user even if the wrong case is used for their email' do

      @user = User.new({
        name:  'luke',
        email: 'lukeluke@luke.com',
        password: 'chewbacca',
        password_confirmation: 'chewbacca'
      })
      @user.save
      @authenticated_user = User.authenticate_with_credentials(' lukeluke@luke.COM ', 'chewbacca')

      expect(@authenticated_user).to be_present
    end
  end
end