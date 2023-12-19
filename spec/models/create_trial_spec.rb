require 'rails_helper'

RSpec.describe Trial, :type => :model do
    context 'Validate trial' do
        it 'belongs to experiment' do
            trial = Trial.reflect_on_association(:experiment)
            expect(trial.macro).to eq(:belongs_to)
        end
    end

    context 'has many factor' do
        it 'it is valid' do
            should respond_to(:factors)
        end
    end

    context 'has many trial_executions' do
        it 'it is valid' do
            should respond_to(:trial_executions)
        end
    end

    context 'has many tags' do
        it 'it is valid' do
            should respond_to(:tags)
        end
    end
end
