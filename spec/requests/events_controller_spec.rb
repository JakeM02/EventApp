require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates a new event' do
      expect {
        post :create, params: { event: { title: 'Test Event', date: '2024-12-31', time: '12:00', location: 'Test Location', organizer: 'Test Organizer' } }
      }.to change(Event, :count).by(1)
    end
  end
end
