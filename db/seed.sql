-- ========================
-- Sample Seed Data for FratRank App
-- ========================

-- Seed Campuses
INSERT INTO campuses (name) VALUES
('University of California - Berkeley'),
('University of Southern California'),
('University of Michigan'),
('Florida State University');

-- Seed Users
INSERT INTO users (campus_id, name, email, password_hash) VALUES
(1, 'Alice Johnson', 'alice@berkeley.edu', 'hashed_password_1'),
(2, 'Brad Thompson', 'brad@usc.edu', 'hashed_password_2'),
(3, 'Cynthia Lee', 'cynthia@umich.edu', 'hashed_password_3'),
(4, 'Derek Smith', 'derek@fsu.edu', 'hashed_password_4');

-- Seed Fraternities
INSERT INTO fraternities (campus_id, name, description) VALUES
(1, 'Alpha Epsilon Pi', 'Known for energetic events and great music.'),
(1, 'Sigma Chi', 'Classic frat with legendary Saturday parties.'),
(2, 'Beta Theta Pi', 'Laid-back vibe, social bonfires.'),
(3, 'Delta Tau Delta', 'Huge game day parties.'),
(4, 'Kappa Alpha Order', 'The go-to place for themed nights.');

-- Seed Parties
INSERT INTO parties (fraternity_id, title, description, event_date, start_time, end_time, location) VALUES
(1, 'Midterm Meltdown', 'A stress relief bash after midterms.', CURRENT_DATE, '21:00', '02:00', '123 Greek Row, Berkeley'),
(2, 'Foam Frenzy Friday', 'Foam party with DJs and drinks.', CURRENT_DATE, '22:00', '03:00', '456 Party Ln, Berkeley'),
(3, 'Sunset Social', 'Chill rooftop event.', CURRENT_DATE, '18:00', '23:00', '789 Campus Dr, USC');

-- Seed Ratings
INSERT INTO ratings (user_id, party_id, rating, comment) VALUES
('00000000-0000-0000-0000-000000000001', 1, 5, 'Best party ever! Great crowd and music.'),
('00000000-0000-0000-0000-000000000002', 2, 4, 'Super fun but a bit crowded.'),
('00000000-0000-0000-0000-000000000003', 3, 3, 'Vibe was chill but not lit enough.');

-- Optional: Party Attendance
INSERT INTO party_attendance (user_id, party_id) VALUES
('00000000-0000-0000-0000-000000000001', 1),
('00000000-0000-0000-0000-000000000002', 2),
('00000000-0000-0000-0000-000000000003', 3);
