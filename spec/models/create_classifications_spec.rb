require 'rails_helper'

RSpec.describe Classification, :type => :model do
    context 'Validate classification' do
        it 'belongs to trial' do
            classification = Classification.reflect_on_association(:tag)
            expect(classification.macro).to eq(:belongs_to)
        end
        it 'belongs to tag' do
            classification = Classification.reflect_on_association(:trial)
            expect(classification.macro).to eq(:belongs_to)
        end
        it 'belongs to trial' do
            classification = Classification.reflect_on_association(:error)
            expect(classification).to eq(nil)
        end
    end
end