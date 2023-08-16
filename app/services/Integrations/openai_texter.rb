module Integrations
  class OpenaiTexter

    attr_reader :choices

    def self.call(prompt)
      new(prompt).call
    end

    def initialize(prompt)
      @prompt = prompt
    end

    URL = "https://api.openai.com/v1/completions"

    def call(num_choices = 1)
      json = ApiClient.new(URL, headers, body(num_choices)).post
      Rails.logger.debug "🔥:#{json}"
      parse_response(json)
    rescue NoMethodError
      "I'm sorry, but I cannot give a response based on the information provided."
    end

    private
    
    def parse_choices(json)
      json["choices"].map { |choice| choice["text"] }
    end

    def parse_response(json)
      @choices = parse_choices(json)
    end

    def headers
      {
        "Content-Type": "application/json",
        "Authorization": ["Bearer", ENV.fetch("OPENAI_ACCESS_TOKEN")].join(" ")
      }
    end

    def body(num_choices = 1)
      {
        model: "text-davinci-003",
        prompt: @prompt,
        max_tokens: 100,
        temperature: 1.6,
        n: num_choices
      }
    end
  end
end
