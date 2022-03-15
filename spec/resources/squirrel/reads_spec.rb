require "rails_helper"

RSpec.describe SquirrelResource, type: :resource do
  describe "serialization" do
    let!(:squirrel) { create(:squirrel) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(squirrel.id)
      expect(data.jsonapi_type).to eq("squirrels")
    end
  end

  describe "filtering" do
    let!(:squirrel1) { create(:squirrel) }
    let!(:squirrel2) { create(:squirrel) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: squirrel2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([squirrel2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:squirrel1) { create(:squirrel) }
      let!(:squirrel2) { create(:squirrel) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      squirrel1.id,
                                      squirrel2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      squirrel2.id,
                                      squirrel1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
