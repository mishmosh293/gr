require "rails_helper"

RSpec.describe "squirrels#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/squirrels", params: params
  end

  describe "basic fetch" do
    let!(:squirrel1) { create(:squirrel) }
    let!(:squirrel2) { create(:squirrel) }

    it "works" do
      expect(SquirrelResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["squirrels"])
      expect(d.map(&:id)).to match_array([squirrel1.id, squirrel2.id])
    end
  end
end
