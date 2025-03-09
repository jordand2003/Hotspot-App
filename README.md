# FratRank 📱🎉

**Real-Time Fraternity Party Rating App for Students & Greek Life**

FratRank is a mobile app that allows students to view and rate fraternity parties happening on their campus in real time. The app helps students find the most popular, active, and fun parties each night—based entirely on feedback and ratings from actual attendees.

---

## 🚀 Project Overview

- Campus-based platform for students to discover and rate fraternity parties.
- Live party ratings submitted by students determine frat rankings for the night.
- Ratings are **day-specific**, so rankings reset daily to reflect current activity.
- Rankings update in **real time** as new reviews come in throughout the night.

---

## 🧠 Key Features

- 🔐 User Authentication (via AWS Cognito)
- 🏫 Campus Selection Flow (students choose campus before viewing parties)
- 🏛 Fraternity Listings (campus-specific frat lists)
- 🎉 Party Listings (frats post parties for specific days)
- ⭐ Live Rating System (students rate parties in real time)
- 📈 Dynamic Daily Rankings (updated based on live user feedback)
- 🔄 Real-Time Updates (via WebSockets)

---

## ⚙️ Tech Stack

| Layer             | Technology                       |
| ----------------- | -------------------------------- |
| Mobile App        | React Native (Expo)              |
| Backend API       | Node.js + Express                |
| Database          | PostgreSQL (AWS RDS)             |
| Authentication    | AWS Cognito                      |
| Realtime Updates  | WebSockets (Socket.IO)           |
| Caching/Queue     | Redis (local or AWS ElastiCache) |
| Hosting (Backend) | AWS EC2 / Elastic Beanstalk      |

---

## 📂 Project Structure

```
/my-frat-party-app
├── /app             # React Native mobile app (Expo)
├── /server          # Node.js backend (Express API)
├── /db              # PostgreSQL schema, seeds, migrations
├── app.config.js    # Expo configuration
├── package.json     # Root dependencies
└── README.md
```

---

## 🛠 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/fratrank.git
cd fratrank
```

### 2. Setup Frontend

```bash
cd app
npm install
npx expo start
```

### 3. Setup Backend

```bash
cd ../server
npm install
npm run dev
```

### 4. Setup PostgreSQL & Redis

- Create a PostgreSQL database.
- Create required tables using /db/schema.sql or ORM models.
- Start a Redis instance locally or connect to AWS ElastiCache.

---

## 📝 License

MIT License
