require 'rails_helper'

RSpec.describe TrialFactor, :type => :model do
    context 'Validate trialFactor' do
        it 'belongs to trial' do
            trial_factor = TrialFactor.reflect_on_association(:trial)
            expect(trial_factor.macro).to eq(:belongs_to)
        end
    end
    context 'Validate trialFactor' do
        it 'belongs to factor' do
            trial_factor = TrialFactor.reflect_on_association(:factor)
            expect(trial_factor.macro).to eq(:belongs_to)
        end
    end
end
