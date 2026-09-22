CREATE TABLE IF NOT EXISTS rooms (
  id SERIAL PRIMARY KEY,
  code TEXT UNIQUE NOT NULL,
  room_type TEXT NOT NULL DEFAULT 'double',
  capacity INT NOT NULL DEFAULT 2 CHECK (capacity > 0),
  price_cents INT NOT NULL DEFAULT 0 CHECK (price_cents >= 0),
  status TEXT NOT NULL DEFAULT 'available' CHECK (status IN ('available','occupied','cleaning','out_of_service'))
);

CREATE TABLE IF NOT EXISTS reservations (
  id SERIAL PRIMARY KEY,
  room_id INT NOT NULL REFERENCES rooms(id) ON DELETE RESTRICT,
  guest_name TEXT NOT NULL,
  check_in DATE NOT NULL,
  check_out DATE NOT NULL CHECK (check_out > check_in),
  status TEXT NOT NULL DEFAULT 'confirmed' CHECK (status IN ('confirmed','checked_in','checked_out','cancelled'))
);

CREATE INDEX IF NOT EXISTS idx_reservations_room_dates ON reservations (room_id, check_in, check_out);

INSERT INTO rooms (code, room_type, capacity, price_cents) VALUES
  ('101','single',1,5500), ('102','double',2,8000), ('201','suite',4,15000)
ON CONFLICT (code) DO NOTHING;
