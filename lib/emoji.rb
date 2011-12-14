module Emoji

  IMAGE_PATH = File.expand_path("../../images", __FILE__)

  def self.names
    @names ||= Dir.entries(IMAGE_PATH).map { |fn| File.basename(fn, '.png') }
  end

  def self.replace(string)
    string.gsub(/:([a-z0-9\+\-_]+):/) do |message|
      name = $1.to_s.downcase
      if names[name]
        %(<span class="emoji emoji-#{name}" title=":#{name}:"></span>)
      else
        message
      end
    end
  end
end