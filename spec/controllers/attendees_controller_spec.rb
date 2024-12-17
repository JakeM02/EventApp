require 'rails_helper'

RSpec.describe AttendeesController, type: :controller do
  let(:event) { Event.create!(title: 'Test Event', date: '2024-12-31', time: '12:00', location: 'Test Location', organizer: 'Organizer') }
  let(:attendee) { Attendee.create!(name: 'John Doe', email: 'john.doe@example.com', event: event) }
  # test if new initializes new attendee for the event
  describe 'GET #new' do
    it 'assigns a new attendee as @attendee' do
      get :new, params: { event_id: event.id }
      expect(assigns(:attendee)).to be_a_new(Attendee)
    end
  end
  # tests for redirect with valid info and doesnt create attendee with invalid info
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new attendee' do
        expect {
          post :create, params: { event_id: event.id, attendee: { name: 'Jane Doe', email: 'jane.doe@example.com' } }
        }.to change(Attendee, :count).by(1)
      end

      it 'redirects to the event page with a success notice' do
        post :create, params: { event_id: event.id, attendee: { name: 'Jane Doe', email: 'jane.doe@example.com' } }
        expect(response).to redirect_to(event_path(event))
        expect(flash[:notice]).to eq('Attendee was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new attendee' do
        expect {
          post :create, params: { event_id: event.id, attendee: { name: '', email: '' } }
        }.not_to change(Attendee, :count)
      end

      it 'renders the new template' do
        post :create, params: { event_id: event.id, attendee: { name: '', email: '' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested attendee as @attendee' do
      get :edit, params: { event_id: event.id, id: attendee.id }
      expect(assigns(:attendee)).to eq(attendee)
    end
  end
  # tests updating attendee info
  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the attendee and redirects to the event page' do
        patch :update, params: { event_id: event.id, id: attendee.id, attendee: { name: 'Updated Name' } }
        attendee.reload
        expect(attendee.name).to eq('Updated Name')
        expect(response).to redirect_to(event_path(event))
        expect(flash[:notice]).to eq('Attendee was successfully updated.')
      end
    end

    context 'with invalid attributes' do
      it 'does not update the attendee and renders the edit template' do
        patch :update, params: { event_id: event.id, id: attendee.id, attendee: { name: '' } }
        attendee.reload
        expect(attendee.name).to eq('John Doe')
        expect(response).to render_template(:edit)
      end
    end
  end
  # tests deleting attendee
  describe 'DELETE #destroy' do
    it 'deletes the attendee and redirects to the event page' do
      attendee_to_delete = Attendee.create!(name: 'Jane Doe', email: 'jane.doe@example.com', event: event)
      expect {
        delete :destroy, params: { event_id: event.id, id: attendee_to_delete.id }
      }.to change(Attendee, :count).by(-1)
      expect(response).to redirect_to(event_path(event))
      expect(flash[:notice]).to eq('Attendee deleted successfully.')
    end
  end
end
