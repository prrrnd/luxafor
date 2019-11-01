RSpec.describe Luxafor::Client do
  before do
    allow(HTTP).to receive(:post)
  end

  describe "#initialize" do
    it "takes the webhook id" do
      client = described_class.new("123")
      expect(client.webhook_id).to eq("123")
    end
  end

  describe "#on" do
    it "sends a POST request with a given color" do
      client = described_class.new("123")

      client.on("FF00AA")

      expect(HTTP).to have_received(:post).with(
        Luxafor::Client::BASE + "/solid_color",
        json: {
          "userId": "123",
          "actionFields": {
            "color": "custom",
            "custom_color": "FF00AA"
          }
        }
      )
    end
  end

  describe "#off" do
    it "sends a POST request with color '000000'" do
      client = described_class.new("123")

      client.off

      expect(HTTP).to have_received(:post).with(
        Luxafor::Client::BASE + "/solid_color",
        json: {
          "userId": "123",
          "actionFields": {
            "color": "custom",
            "custom_color": "000000"
          }
        })
    end
  end
end
