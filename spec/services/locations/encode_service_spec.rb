require "application_helper"

RSpec.describe Locations::EncodeService do
  subject { described_class }

  before do
    FactoryBot.create(:location)
  end

  describe "#call" do
    context "without any errors" do
      let(:city_params) do
        {
          city: "Адыгейск"
        }
      end

      it "should return valide result" do
        result = subject.call(city_params)
        expect{ result }.not_to raise_error
        expect(result.success?).to be_truthy
        expect(result.location.geo_lat).not_to be_nil
        expect(result.location.geo_lon).not_to be_nil
      end
    end
  end
end