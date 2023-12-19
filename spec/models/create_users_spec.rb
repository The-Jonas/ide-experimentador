require 'rails_helper'

RSpec.describe User, :type => :model do
    context 'valid user' do
        it 'name valid' do
            user = User.new(name: 'nome')
            expect(user).to be_valid
        end
        it 'email valid' do
            user = User.new(email: 'nome@email.com')
            expect(user).to be_valid
        end
        it 'password valid' do
            user = User.new(password: '123456')
            expect(user).to be_valid
        end
    end
end