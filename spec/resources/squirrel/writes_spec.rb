require "rails_helper"

RSpec.describe SquirrelResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "squirrels",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SquirrelResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Squirrel.count }.by(1)
    end
  end

  describe "updating" do
    let!(:squirrel) { create(:squirrel) }

    let(:payload) do
      {
        data: {
          id: squirrel.id.to_s,
          type: "squirrels",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SquirrelResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { squirrel.reload.updated_at }
      # .and change { squirrel.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:squirrel) { create(:squirrel) }

    let(:instance) do
      SquirrelResource.find(id: squirrel.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Squirrel.count }.by(-1)
    end
  end
end
