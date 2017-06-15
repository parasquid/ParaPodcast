class AppController < ApplicationController
  def index
    # renders the app
  end

  def feed
    url = "http://rss.art19.com/tell-me-something-i-don-t-know"
    xml = HTTParty.get(url).body
    entries = Feedjira::Feed.parse(xml).entries
    data = entries.map { |entry|
      {
        type: "entry",
        id: entry.entry_id,
        attributes: entry.to_h
      }
    }
    render json: data
  end

end
