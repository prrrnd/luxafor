require "http"

module Luxafor
  class Client
    BASE = "https://api.luxafor.com/webhook/v1/actions"

    attr_reader :webhook_id

    def initialize(webhook_id)
      @webhook_id = webhook_id
    end

    def on(color = "FF00FF")
      HTTP.post(BASE + "/solid_color", json: {
        "userId": webhook_id,
        "actionFields": {
          "color": "custom",
          "custom_color": color
        }
      })
    end

    def off
      on("000000")
    end
  end
end
