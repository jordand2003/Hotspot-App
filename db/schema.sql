-- ========================
-- PostgreSQL Schema for FratRank App
-- ========================

-- CAMPUS TABLE
CREATE TABLE campuses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- USERS TABLE
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    campus_id INT REFERENCES campuses(id),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- FRATERNITIES TABLE
CREATE TABLE fraternities (
    id SERIAL PRIMARY KEY,
    campus_id INT REFERENCES campuses(id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PARTIES TABLE
CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    fraternity_id INT REFERENCES fraternities(id),
    title VARCHAR(100) NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    start_time TIME,
    end_time TIME,
    location TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- RATINGS TABLE
CREATE TABLE ratings (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    party_id INT REFERENCES parties(id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, party_id)
);

-- PARTY ATTENDANCE TABLE (Optional Future Feature)
CREATE TABLE party_attendance (
    id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    party_id INT REFERENCES parties(id),
    checked_in_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- VIEW: Daily Rankings by Avg Rating
CREATE VIEW daily_party_rankings AS
SELECT
    party_id,
    AVG(rating) AS avg_rating,
    COUNT(*) AS total_votes,
    event_date
FROM ratings
JOIN parties ON ratings.party_id = parties.id
GROUP BY party_id, event_date
ORDER BY event_date, avg_rating DESC;
