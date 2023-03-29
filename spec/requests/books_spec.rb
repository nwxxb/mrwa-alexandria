require 'rails_helper'

RSpec.describe 'Books', type: :request do

  describe 'GET /api/books' do
    context 'default behaviour' do
      it 'receives HTTP status 200' do
        generate_books
        get '/api/books'
        expect(response.status).to eq(200)
      end

      it 'receives a json with the "data" root key' do
        generate_books
        get '/api/books'
        expect(JSON.parse(response.body)['data']).to_not be nil
      end

      it 'receives a json with the "data" root key' do
        generate_books
        get '/api/books'
        expect(JSON.parse(response.body)['data'].size).to eq 3
      end
    end

  end

  def generate_books
    [
      create(:ruby_microscope),
      create(:ruby_on_rails_tutorial),
      create(:agile_web_development)
    ]
  end

end
