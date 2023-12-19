require 'rails_helper'

RSpec.describe Tag, :type => :model do
    context 'has many trials' do
        it 'it is valid' do
            should respond_to(:trials)
        end
    end
end