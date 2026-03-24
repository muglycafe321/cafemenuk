-- =============================================
-- MUGLY CAFÉ - SUPABASE SETUP SQL
-- Run this in Supabase SQL Editor
-- =============================================

-- TABLE 1: special_offer
CREATE TABLE IF NOT EXISTS special_offer (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  price INTEGER NOT NULL,
  sort_order INTEGER DEFAULT 0
);

-- TABLE 2: menu_categories
CREATE TABLE IF NOT EXISTS menu_categories (
  id SERIAL PRIMARY KEY,
  slug TEXT UNIQUE NOT NULL,
  label TEXT NOT NULL,
  type TEXT DEFAULT 'veg',
  sort_order INTEGER DEFAULT 0
);

-- TABLE 3: menu_items
CREATE TABLE IF NOT EXISTS menu_items (
  id SERIAL PRIMARY KEY,
  category_slug TEXT REFERENCES menu_categories(slug) ON DELETE CASCADE,
  name TEXT NOT NULL,
  price INTEGER NOT NULL,
  type TEXT DEFAULT NULL,
  sort_order INTEGER DEFAULT 0
);

-- Enable RLS
ALTER TABLE special_offer ENABLE ROW LEVEL SECURITY;
ALTER TABLE menu_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE menu_items ENABLE ROW LEVEL SECURITY;

-- Public read policies
CREATE POLICY "public read special_offer" ON special_offer FOR SELECT USING (true);
CREATE POLICY "public read menu_categories" ON menu_categories FOR SELECT USING (true);
CREATE POLICY "public read menu_items" ON menu_items FOR SELECT USING (true);

-- Anon write policies
CREATE POLICY "anon write special_offer" ON special_offer FOR ALL USING (true);
CREATE POLICY "anon write menu_categories" ON menu_categories FOR ALL USING (true);
CREATE POLICY "anon write menu_items" ON menu_items FOR ALL USING (true);

-- Clear existing data
DELETE FROM special_offer;
DELETE FROM menu_items;
DELETE FROM menu_categories;

-- =============================================
-- SEED SPECIAL OFFERS (Updated)
-- =============================================
INSERT INTO special_offer (name, price, sort_order) VALUES
  ('Fried Chicken Kids Meal', 99, 1),
  ('Fried Chicken Couple Meal', 170, 2),
  ('Fried Chicken Dinner Meal', 299, 3);

-- =============================================
-- SEED MENU CATEGORIES
-- =============================================
INSERT INTO menu_categories (slug, label, type, sort_order) VALUES
  ('rolls', 'Rolls', 'veg', 1),
  ('loaded-fries', 'Loaded Fries', 'veg', 2),
  ('chicken', 'Chicken Items', 'nonveg', 3),
  ('maggi', 'Maggi', 'veg', 4),
  ('sandwich', 'Sandwich', 'veg', 5),
  ('pasta', 'Pasta', 'veg', 6),
  ('pizza', 'Pizza', 'veg', 7),
  ('momos', 'Momos', 'nonveg', 8),
  ('burger', 'Burger', 'mixed', 9),
  ('fresh-cream', 'Fresh Cream', 'veg', 10),
  ('falooda', 'Falooda', 'veg', 11),
  ('ice-cream', 'Ice Cream', 'veg', 12),
  ('mojito', 'Mojito', 'veg', 13),
  ('lemon', 'Lemon', 'veg', 14),
  ('avil-milk', 'Avil Milk', 'veg', 15),
  ('shake', 'Shake', 'veg', 16),
  ('shake-tender', 'Shake & Tender', 'veg', 17),
  ('juice', 'Juice', 'veg', 18),
  ('hot-drinks', 'Hot Drinks', 'veg', 19);

-- =============================================
-- SEED MENU ITEMS (Updated Prices)
-- =============================================

-- ROLLS
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('rolls', 'Paneer Roll', 75, 'veg', 1),
  ('rolls', 'Fried Roll', 80, 'veg', 2),
  ('rolls', 'Falafel Roll', 60, 'veg', 3),
  ('rolls', 'Sp. Falafel Roll', 80, 'veg', 4),
  ('rolls', 'Zinger Wrap', 120, 'veg', 5),
  ('rolls', 'Porotta Roll', 70, 'veg', 6),
  ('rolls', 'Beef Wrap Roll', 150, 'nonveg', 7);

-- LOADED FRIES (Updated)
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('loaded-fries', 'Loaded Normal H/F', 150, 'veg', 1),
  ('loaded-fries', 'Loaded Cheese', 200, 'veg', 2),
  ('loaded-fries', 'Loaded Peri Peri', 220, 'veg', 3),
  ('loaded-fries', 'Loaded Special', 240, 'veg', 4);

-- CHICKEN ITEMS
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('chicken', 'Special Fried 1pcs', 140, 'nonveg', 1),
  ('chicken', 'Chicken Lolly Pop', 160, 'nonveg', 2),
  ('chicken', 'Peri Peri Dynamic', 180, 'nonveg', 3),
  ('chicken', 'Shezwan Wings', 160, 'nonveg', 4),
  ('chicken', 'CH Nuggets', 140, 'nonveg', 5),
  ('chicken', 'Chicken Strip', 160, 'nonveg', 6),
  ('chicken', 'Pop Chick', 130, 'nonveg', 7),
  ('chicken', 'Chicken Wings Normal', 140, 'nonveg', 8);

-- MAGGI
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('maggi', 'Maggi', 60, 'veg', 1),
  ('maggi', 'Maggi Special', 90, 'veg', 2),
  ('maggi', 'Cheese Maggi', 140, 'veg', 3);

-- SANDWICH
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('sandwich', 'Normal Sandwich', 99, 'veg', 1),
  ('sandwich', 'Club Special Sandwich', 220, 'veg', 2);

-- PASTA
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('pasta', 'Pasta', 210, 'veg', 1),
  ('pasta', 'Pasta Special', 260, 'veg', 2);

-- PIZZA (Updated)
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('pizza', 'Normal Pizza', 230, 'veg', 1),
  ('pizza', 'Peri Peri Pizza', 250, 'veg', 2),
  ('pizza', 'BBQ Pizza', 249, 'veg', 3),
  ('pizza', 'Paneer Pizza', 220, 'veg', 4),
  ('pizza', 'Mushroom Pizza', 230, 'veg', 5);

-- MOMOS (Updated - Tandoori removed, Fried added)
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('momos', 'CH Steam Momos', 160, 'nonveg', 1),
  ('momos', 'Shezwan Momos', 180, 'nonveg', 2),
  ('momos', 'Fried Momos', 160, 'nonveg', 3);

-- BURGER (Updated)
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('burger', 'Chicken Burger', 90, 'nonveg', 1),
  ('burger', 'Crispy Double Burger', 189, 'nonveg', 2),
  ('burger', 'Veg Burger', 80, 'veg', 3),
  ('burger', 'Zinger Burger', 120, 'nonveg', 4),
  ('burger', 'Kids Burger', 60, 'nonveg', 5),
  ('burger', 'Aloo Tikka Burger', 100, 'veg', 6),
  ('burger', 'Falafel Burger', 70, 'veg', 7);

-- FRESH CREAM
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('fresh-cream', 'Custard Cream', 190, 'veg', 1),
  ('fresh-cream', 'Apple Cream', 190, 'veg', 2),
  ('fresh-cream', 'Dry Fruit Cream', 210, 'veg', 3),
  ('fresh-cream', 'Mango Cream', 190, 'veg', 4),
  ('fresh-cream', 'Berry Mix Cream', 240, 'veg', 5),
  ('fresh-cream', 'Mixed Fruit Cream', 220, 'veg', 6),
  ('fresh-cream', 'Fruit With Choco', 135, 'veg', 7);

-- FALOODA
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('falooda', 'Dry Fruit Falooda', 180, 'veg', 1),
  ('falooda', 'Normal Falooda', 120, 'veg', 2),
  ('falooda', 'Royal Falooda', 140, 'veg', 3),
  ('falooda', 'Special Falooda', 180, 'veg', 4),
  ('falooda', 'Chocolate Falooda', 180, 'veg', 5),
  ('falooda', 'Fruit Salad', 70, 'veg', 6),
  ('falooda', 'Cut Fruit With Honey', 70, 'veg', 7),
  ('falooda', 'Butter Fruit With Honey', 100, 'veg', 8);

-- ICE CREAM
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('ice-cream', 'Scoop', 40, 'veg', 1),
  ('ice-cream', 'Special Scoop', 90, 'veg', 2),
  ('ice-cream', 'Cake With Ice Cream', 160, 'veg', 3);

-- MOJITO
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('mojito', 'Blueberry', 80, 'veg', 1),
  ('mojito', 'Strawberry', 80, 'veg', 2),
  ('mojito', 'Green Apple', 80, 'veg', 3),
  ('mojito', 'Passion Fruit', 80, 'veg', 4),
  ('mojito', 'Blue Curacao', 80, 'veg', 5),
  ('mojito', 'Mint', 80, 'veg', 6),
  ('mojito', 'Watermelon', 80, 'veg', 7),
  ('mojito', 'Mango', 80, 'veg', 8);

-- LEMON
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('lemon', 'Fresh Lime', 20, 'veg', 1),
  ('lemon', 'Mint Lemon', 25, 'veg', 2),
  ('lemon', 'Passion Fruit Lime', 30, 'veg', 3),
  ('lemon', 'Green Apple Lime', 30, 'veg', 4),
  ('lemon', 'Flavors Lime', 30, 'veg', 5);

-- AVIL MILK
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('avil-milk', 'Avil Milk', 70, 'veg', 1),
  ('avil-milk', 'Avil Milk With Dry Fruits', 90, 'veg', 2),
  ('avil-milk', 'Avil Milk Special', 110, 'veg', 3);

-- SHAKE (Updated)
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('shake', 'Chickoo', 60, 'veg', 1),
  ('shake', 'Sharjah', 60, 'veg', 2),
  ('shake', 'Apple', 80, 'veg', 3),
  ('shake', 'Anar', 80, 'veg', 4),
  ('shake', 'Cocktail', 60, 'veg', 5),
  ('shake', 'Butter', 80, 'veg', 6),
  ('shake', 'Tender Coconut Special', 70, 'veg', 7),
  ('shake', 'Ice Cream Shake', 80, 'veg', 8),
  ('shake', 'Mango', 70, 'veg', 9),
  ('shake', 'Dry Fruits', 90, 'veg', 10),
  ('shake', 'Dates & Roasted Cashew', 120, 'veg', 11),
  ('shake', 'Custard Apple', 70, 'veg', 12),
  ('shake', 'Blueberry', 100, 'veg', 13),
  ('shake', 'Strawberry', 90, 'veg', 14),
  ('shake', 'Berry Mix', 120, 'veg', 15),
  ('shake', 'Galaxy Shake', 80, 'veg', 16),
  ('shake', 'Oreo', 70, 'veg', 17),
  ('shake', 'Kitkat', 80, 'veg', 18),
  ('shake', 'Gems', 80, 'veg', 19),
  ('shake', 'Dragon Fruit', 90, 'veg', 20);

-- SHAKE & TENDER COCONUT
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('shake-tender', 'Cashew With Tender', 90, 'veg', 1),
  ('shake-tender', 'Dry Fruits With Tender', 100, 'veg', 2),
  ('shake-tender', 'Boost With Tender', 80, 'veg', 3),
  ('shake-tender', 'Dates With Tender', 90, 'veg', 4),
  ('shake-tender', 'Badam With Tender', 90, 'veg', 5);

-- JUICE
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('juice', 'Orange', 60, 'veg', 1),
  ('juice', 'Musambi', 60, 'veg', 2),
  ('juice', 'Papaya', 60, 'veg', 3),
  ('juice', 'Grape', 60, 'veg', 4),
  ('juice', 'Anar', 60, 'veg', 5),
  ('juice', 'Watermelon', 60, 'veg', 6),
  ('juice', 'Pineapple', 60, 'veg', 7),
  ('juice', 'Mango', 60, 'veg', 8);

-- HOT DRINKS
INSERT INTO menu_items (category_slug, name, price, type, sort_order) VALUES
  ('hot-drinks', 'Coffee', 15, 'veg', 1),
  ('hot-drinks', 'SP Coffee', 30, 'veg', 2),
  ('hot-drinks', 'Tea', 15, 'veg', 3),
  ('hot-drinks', 'Lemon Tea', 15, 'veg', 4),
  ('hot-drinks', 'Boost', 20, 'veg', 5),
  ('hot-drinks', 'Horlicks', 20, 'veg', 6),
  ('hot-drinks', 'Badam Milk', 25, 'veg', 7);
