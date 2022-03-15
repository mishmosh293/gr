require 'rails_helper'

RSpec.describe "squirrels#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/squirrels/#{squirrel.id}", params: params
  end

  describe 'basic fetch' do
    let!(:squirrel) { create(:squirrel) }

    it 'works' do
      expect(SquirrelResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('squirrels')
      expect(d.id).to eq(squirrel.id)
    end
  end
end
