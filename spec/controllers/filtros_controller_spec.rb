
require 'rails_helper'

RSpec.describe FiltrosController, type: :controller do
    describe 'GET #index' do
        it 'renders the index template' do
            get :index
            expect(response).to render_template(:index)
        end
        
        context '' do
          let!(:experiment) { create(:experiment, name: 'Experimento 1') }
          let!(:test) { create(:trial, experiment: experiment, name: 'Teste 1') }
          let!(:factor) { create(:factor, name: 'Carga') }
          let!(:trial_factor) { create(:trial_factor, trial: test, factor: factor, value: '50%') }
        end
        context '' do
          let!(:experiment) { create(:experiment, name: 'Experimento 8') }
          let!(:test) { create(:trial, experiment: experiment, name: 'Teste 9') }
          let!(:factor) { create(:factor, name: 'Carga') }
          let!(:trial_factor) { create(:trial_factor, trial: test, factor: factor, value: '80%') }
        end
        context '' do
          let!(:experiment) { create(:experiment, name: 'Experimento 4') }
          let!(:test) { create(:trial, experiment: experiment, name: 'Teste 4') }
          let!(:factor) { create(:factor, name: 'Carga') }
          let!(:trial_factor) { create(:trial_factor, trial: test, factor: factor, value: '100%') }
        end
        context '' do
          let!(:experiment) { create(:experiment, name: 'Experimento 2') }
          let!(:test) { create(:trial, experiment: experiment, name: 'Teste 6') }
          let!(:factor) { create(:factor, name: 'Carga') }
          let!(:trial_factor) { create(:trial_factor, trial: test, factor: factor, value: '20%') }
        end
    end
end

