# 📰 Breaking News Ticker

A TV-style breaking news ticker built with Ruby/Sinatra that displays real-time headlines from the GNews API.

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Sinatra](https://img.shields.io/badge/Sinatra-000000?style=for-the-badge&logo=ruby&logoColor=white)

## Features

- Animated scrolling ticker with hover-to-pause
- Clickable headlines linking to full articles
- Responsive dark theme with red accents
- Works in demo mode without API key

## Quick Start

```bash
bundle install
cp .env.example .env   # Add your GNEWS_API_KEY
ruby app.rb            # Visit http://localhost:4567
```

Get a free API key at [GNews.io](https://gnews.io) (100 requests/day).

## Deploy to Render

1. Push to GitHub
2. Create Web Service on [Render](https://render.com)
3. Set environment variable: `GNEWS_API_KEY`

Build and start commands are pre-configured in `render.yaml`.

## License

[MIT License](LICENSE)
