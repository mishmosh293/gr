require "rails_helper"

RSpec.describe "squirrels#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/squirrels/#{squirrel.id}"
  end

  describe "basic destroy" do
    let!(:squirrel) { create(:squirrel) }

    it "updates the resource" do
      expect(SquirrelResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Squirrel.count }.by(-1)
      expect { squirrel.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
