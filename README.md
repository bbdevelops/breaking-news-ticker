# 📰 Breaking News Ticker

A dynamic breaking news ticker web application built with Sinatra that fetches real-time headlines from the GNews API and displays them in a visually stunning, TV-style news ticker format.

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Sinatra](https://img.shields.io/badge/Sinatra-000000?style=for-the-badge&logo=ruby&logoColor=white)

## 🌟 Features

- **Live News Ticker**: Animated scrolling ticker displaying the latest headlines
- **Clickable Headlines**: Each headline links to the full article
- **Hover to Pause**: Ticker pauses on hover so you can click through
- **Responsive Design**: Looks great on desktop, tablet, and mobile devices
- **Modern UI**: Dark theme with eye-catching red accents inspired by TV news broadcasts
- **Real-time Updates**: Fresh news from the GNews API on every page load

## 📸 Preview

The app features:
- A prominent "BREAKING NEWS" label with pulsing live indicator
- Horizontally scrolling news ticker (hover to pause)
- Click-through links to full articles

## 🚀 Getting Started

### Prerequisites

- Ruby (version 2.7 or higher recommended)
- Bundler gem

### Local Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/breaking-news-ticker.git
   cd breaking-news-ticker
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up your API key**
   
   Get a free API key from [GNews.io](https://gnews.io) (100 requests/day on free tier)
   
   ```bash
   # Copy the example env file
   cp .env.example .env
   
   # Edit .env and add your API key
   GNEWS_API_KEY=your_actual_api_key_here
   ```

4. **Run the application**
   ```bash
   ruby app.rb
   ```

5. **Open in browser**
   
   Visit [http://localhost:4567](http://localhost:4567)

## ☁️ Deployment (Render)

This app is configured for deployment on [Render](https://render.com):

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Create a new Web Service on Render**
   - Connect your GitHub repository
   - Select "Ruby" as the environment
   - Build Command: `bundle install`
   - Start Command: `bundle exec puma -C config/puma.rb`

3. **Add Environment Variable**
   - In Render dashboard, go to **Environment**
   - Add: `GNEWS_API_KEY` = your API key
   
   Or use GitHub repository secrets if deploying via GitHub Actions.

## 🎯 How to Use

1. **View Headlines**: Breaking news headlines scroll automatically
2. **Pause**: Hover over the ticker to pause scrolling
3. **Read More**: Click any headline to open the full article in a new tab

## 🔧 Configuration

| Variable | Description | Required |
|----------|-------------|----------|
| `GNEWS_API_KEY` | Your GNews API key | Yes (for live data) |

**Note**: The app works in demo mode without an API key, showing placeholder content.

## 📁 Project Structure

```
breaking-news-ticker/
├── app.rb              # Main Sinatra application
├── config.ru           # Rack configuration
├── Procfile            # Process configuration for deployment
├── Gemfile             # Ruby dependencies
├── config/
│   └── puma.rb         # Puma web server config
├── views/
│   ├── layout.erb      # HTML layout template
│   └── index.erb       # Main page template
└── public/
    └── css/
        └── styles.css  # All styling
```

## 🎨 Design Highlights

- **Color Scheme**: Dark background (#1a1a2e) with red accents (#cc0000) and gold highlights (#ffd700)
- **Typography**: Roboto and Roboto Condensed fonts for a professional news look
- **Animations**: Smooth ticker scroll, card hover effects, and pulsing live indicator
- **Responsive**: CSS Grid layout adapts from mobile to large screens

## 🌐 API Reference

This app uses the [GNews API](https://gnews.io/docs/v4):

- **Endpoint**: `https://gnews.io/api/v4/top-headlines`
- **Free Tier**: 100 requests/day
- **Categories**: general, business, technology, sports, entertainment, health, science

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [GNews API](https://gnews.io) for providing news data
- [Sinatra](http://sinatrarb.com/) for the lightweight Ruby framework
- [Google Fonts](https://fonts.google.com/) for the Roboto font family

---

Built with ❤️ as a learning project for dynamic web applications
