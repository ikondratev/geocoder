require "application_helper"

describe AdsService::HTTP::Client, type: :client do
  subject { described_class.new(connection: connection) }

  before do
    stubs.post("http://localhost:9292/1/update_coordinates") { [status, headers, body.to_json] }
  end

  let(:status) { 200 }
  let(:headers) { { "Content-Type" => "application/json" } }
  let(:body) { {} }

  describe "#geocode_coordinates" do
    context "without any errors" do
      it "should return valid result" do
        result = subject.geocode_coordinates(lat: 1.2, lon:1.3, post_id: 1)
        expect { result }.not_to raise_error
        expect(result.status).to be 200
      end
    end
  end
end

