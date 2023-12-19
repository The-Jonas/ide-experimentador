require 'rails_helper'

RSpec.describe TrialExecution, :type => :model do
    context 'Validate trial_execution' do
        it 'belongs to trial' do
            trial_execution = TrialExecution.reflect_on_association(:trial)
            expect(trial_execution.macro).to eq(:belongs_to)
        end
    end
end
