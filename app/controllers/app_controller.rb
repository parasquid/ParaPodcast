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
        type: "urls",
        attributes: {
          title: entry.title,
          summary: entry.summary,
          enclosure_url: entry.enclosure_url,
          enclosure_type: entry.enclosure_type
        }
      }
    }
    render json: data
  end

end
