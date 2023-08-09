class OpenaiTexter
  def self.call(prompt)
    new(prompt).call
  end

  def initialize(prompt)
    @prompt = prompt
  end

  URL = "https://api.openai.com/v1/completions"

  def call
    json = ApiClient.new(URL, headers, body).post
    Rails.logger.debug "🔥:#{json}"
    json["choices"].first["text"]
  rescue NoMethodError
    "I'm sorry, but I cannot give a response based on the information provided."
  end

  private

  def headers
    {
      "Content-Type": "application/json",
      "Authorization": ["Bearer", ENV.fetch("OPENAI_ACCESS_TOKEN")].join(" ")
    }
  end

  def body
    {
      model: "text-davinci-003",
      prompt: @prompt,
      max_tokens: 100,
      temperature: 0
    }
  end

end
