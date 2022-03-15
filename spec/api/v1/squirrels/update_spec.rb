require "rails_helper"

RSpec.describe "squirrels#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/squirrels/#{squirrel.id}", payload
  end

  describe "basic update" do
    let!(:squirrel) { create(:squirrel) }

    let(:payload) do
      {
        data: {
          id: squirrel.id.to_s,
          type: "squirrels",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SquirrelResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { squirrel.reload.attributes }
    end
  end
end
