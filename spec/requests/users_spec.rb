require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'renders the index template and includes correct placeholder text' do
      # make get request
      get '/users'
      # check response body/status
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('This page lists all the registered users')
    end
  end
  describe 'GET /show' do
    it 'renders the show template and includes correct placeholder text' do
      get '/users/:id'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('This page shows the page for a given logged in user')
    end
  end
end
