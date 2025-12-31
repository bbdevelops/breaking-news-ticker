require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require "dotenv/load"

# Fetch news from GNews API (free tier available)
get "/" do
  # GNews API - free tier allows 100 requests/day
  api_key = ENV["GNEWS_API_KEY"] || "demo"
  
  begin
    if api_key == "demo"
      # Demo data when no API key is set
      @articles = [
        { "title" => "Welcome to Breaking News Ticker!", "description" => "Add your GNews API key to see real headlines.", "url" => "#", "source" => { "name" => "Demo" }, "publishedAt" => Time.now.to_s },
        { "title" => "Get Your Free API Key", "description" => "Visit gnews.io to get a free API key with 100 requests per day.", "url" => "https://gnews.io", "source" => { "name" => "GNews" }, "publishedAt" => Time.now.to_s },
        { "title" => "Breaking News Feature Ready", "description" => "Your ticker is set up and ready to display real news!", "url" => "#", "source" => { "name" => "System" }, "publishedAt" => Time.now.to_s }
      ]
    else
      response = HTTP.get("https://gnews.io/api/v4/top-headlines", params: {
        category: "general",
        lang: "en",
        country: "us",
        max: 10,
        apikey: api_key
      })
      
      data = JSON.parse(response.body.to_s)
      @articles = data["articles"] || []
    end
  rescue => e
    @articles = [{ "title" => "Error fetching news: #{e.message}", "description" => "", "url" => "#", "source" => { "name" => "Error" }, "publishedAt" => Time.now.to_s }]
  end
  
  erb :index
end

# Category-specific news
get "/category/:category" do
  api_key = ENV["GNEWS_API_KEY"] || "demo"
  category = params[:category]
  
  begin
    if api_key == "demo"
      @articles = [
        { "title" => "Demo Mode - #{category.capitalize} News", "description" => "Add your GNews API key to see real #{category} headlines.", "url" => "#", "source" => { "name" => "Demo" }, "publishedAt" => Time.now.to_s }
      ]
    else
      response = HTTP.get("https://gnews.io/api/v4/top-headlines", params: {
        category: category,
        lang: "en",
        country: "us",
        max: 10,
        apikey: api_key
      })
      
      data = JSON.parse(response.body.to_s)
      @articles = data["articles"] || []
    end
  rescue => e
    @articles = [{ "title" => "Error fetching news: #{e.message}", "description" => "", "url" => "#", "source" => { "name" => "Error" }, "publishedAt" => Time.now.to_s }]
  end
  
  @current_category = category
  erb :index
end
