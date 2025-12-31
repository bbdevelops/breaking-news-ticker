# Functional Specification: Breaking News Ticker

## Project Name & 1-Liner

**Breaking News Ticker** — A dynamic, TV-style scrolling news ticker that displays real-time headlines from around the world.

---

## Pain Point

News consumers today are overwhelmed with information. Traditional news websites require active engagement—scrolling, clicking, and reading lengthy articles. Users who want a quick, passive way to stay informed while multitasking (working, studying, or browsing) have limited options. They need a **glanceable, ambient news display** that delivers headlines without demanding their full attention.

---

## Target User Persona

**Name:** Alex, 28  
**Occupation:** Remote Software Developer  
**Behavior:** Works from home with multiple monitors. Likes to stay informed but doesn't have time to actively read news sites throughout the day.  
**Goals:**
- Stay updated on breaking news without interrupting workflow
- Quickly scan headlines and only click through for stories that matter
- Have a visually appealing display that fits their workspace aesthetic

**Frustrations:**
- News apps send too many notifications
- Social media news feeds are cluttered with opinions and ads
- Traditional news sites require too much active engagement

---

## Hypothesis

We believe that **remote workers and multitaskers** want a **passive, ambient news experience**. By providing a **clean, scrolling ticker with clickable headlines**, we can help users stay informed at a glance without disrupting their workflow.

**We will know this is true when:**
- Users keep the ticker open for extended periods
- Users click through to read full articles
- Users return to the app regularly

---

## User Stories

### MVP (Proof of Concept)

| User Story |
|------------|
| As a user, I want to see breaking news headlines scrolling across my screen, so that I can passively stay informed. |
| As a user, I want to click on a headline to read the full article, so that I can dive deeper into stories that interest me. |
| As a user, I want the ticker to pause when I hover over it, so that I can read and click on a specific headline. |

## Sketches

### App Flow (Single Screen Application)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                         USER OPENS APP                                      │
│                              │                                              │
│                              ▼                                              │
│                    ┌─────────────────┐                                      │
│                    │  Fetch News API │                                      │
│                    └────────┬────────┘                                      │
│                              │                                              │
│                              ▼                                              │
│                    ┌─────────────────┐                                      │
│                    │ Display Ticker  │◄─────────────┐                       │
│                    │ (Auto-Scroll)   │              │                       │
│                    └────────┬────────┘              │                       │
│                              │                      │                       │
│              ┌───────────────┼───────────────┐      │                       │
│              │               │               │      │                       │
│              ▼               ▼               ▼      │                       │
│        ┌──────────┐   ┌──────────┐   ┌──────────┐   │                       │
│        │  Hover   │   │  Click   │   │  Scroll  │   │                       │
│        │ (Pause)  │   │ Headline │   │ Continues│───┘                       │
│        └────┬─────┘   └────┬─────┘   └──────────┘                           │
│             │              │                                                │
│             ▼              ▼                                                │
│        ┌──────────┐   ┌──────────────┐                                      │
│        │  Resume  │   │ Open Article │                                      │
│        │  Scroll  │   │ (New Tab)    │                                      │
│        └──────────┘   └──────────────┘                                      │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Main Screen Wireframe

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                                                                             │
│                                                                             │
│                                                                             │
│   ┌─────────────────────────────────────────────────────────────────────┐   │
│   │ ┌──────────────┐ ┌────────────────────────────────────────────────┐ │   │
│   │ │ ● BREAKING   │ │  ● Headline 1...  ● Headline 2...  ● Headline  │ │   │
│   │ │   NEWS       │ │    ──────────────────────────────────────────► │ │   │
│   │ └──────────────┘ └────────────────────────────────────────────────┘ │   │
│   └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
│                                                                             │
│                                                                             │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘

     ▲                  ▲                              ▲
     │                  │                              │
     │                  │                              │
┌────┴────┐      ┌──────┴──────┐              ┌────────┴────────┐
│ Pulsing │      │  Clickable  │              │ Scrolling       │
│ Yellow  │      │  Headlines  │              │ Animation       │
│ "Live"  │      │  (Links)    │              │ (Pauses on      │
│ Dot     │      │             │              │  Hover)         │
└─────────┘      └─────────────┘              └─────────────────┘
```

### Interaction States

```
┌─────────────────────────────────────────────────────────────────┐
│                     DEFAULT STATE                               │
├─────────────────────────────────────────────────────────────────┤
│  ● BREAKING NEWS  │  ● Headline scrolls...  ● Next headline...  │
│                   │  ──────────────────────────────────────────►│
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                     HOVER STATE (Paused)                        │
├─────────────────────────────────────────────────────────────────┤
│  ● BREAKING NEWS  │  ● [Headline turns GOLD on hover] ●         │
│                   │     ▲                                       │
│                   │     │ cursor                                │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                     CLICK → Opens Full Article                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│     https://news-source.com/article...  (NEW TAB)               │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Technical Implementation

### API Integration
- **API:** GNews API (https://gnews.io)
- **Free Tier:** 100 requests/day
- **Data:** Top headlines with title, description, URL, source, and publish date

### Tech Stack
- **Backend:** Ruby + Sinatra
- **Frontend:** HTML/CSS (ERB templates)
- **Styling:** Custom CSS with animations
- **No Database:** Pure API-driven, stateless application

---


*Document Version: 1.0*  
*Last Updated: December 31, 2025*
