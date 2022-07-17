import sqlite3

class Gen():
    def gen2(self):

        conn = sqlite3.connect("food_recipes.db")
        cur = conn.cursor()

        cur.execute("""CREATE TABLE IF NOT EXISTS chicken(
        chicken_id integer PRIMARY KEY, 
        chicken_name TEXT, 
        chicken_course TEXT, 
        chicken_prep INTEGER, 
        chicken_cal INTEGER,
        chicken_servings INTEGER,
        chicken_ingredients TEXT,
        chicken_instructions TEXT)""")

        cur.execute("""CREATE TABLE IF NOT EXISTS pork(
        pork_id integer PRIMARY KEY, 
        pork_name TEXT, 
        pork_course TEXT, 
        pork_prep INTEGER, 
        pork_cal INTEGER,
        pork_servings INTEGER,
        pork_ingredients TEXT,
        pork_instructions TEXT)""")

        cur.execute("""CREATE TABLE IF NOT EXISTS fish(
        fish_id integer PRIMARY KEY, 
        fish_name TEXT, 
        fish_course TEXT, 
        fish_prep INTEGER, 
        fish_cal INTEGER,
        fish_servings INTEGER,
        fish_ingredients TEXT,
        fish_instructions TEXT)""")

        cur.execute("""CREATE TABLE IF NOT EXISTS beef(
        beef_id integer PRIMARY KEY, 
        beef_name TEXT, 
        beef_course TEXT, 
        beef_prep INTEGER, 
        beef_cal INTEGER,
        beef_servings INTEGER,
        beef_ingredients TEXT,
        beef_instructions TEXT)""")

        cur.execute("""CREATE TABLE IF NOT EXISTS pasta(
        pasta_id integer PRIMARY KEY, 
        pasta_name TEXT, 
        pasta_course TEXT, 
        pasta_prep INTEGER, 
        pasta_cal INTEGER,
        pasta_servings INTEGER,
        pasta_ingredients TEXT,
        pasta_instructions TEXT)""")

        cur.execute("""CREATE TABLE IF NOT EXISTS vegie(
        vegie_id integer PRIMARY KEY, 
        vegie_name TEXT, 
        vegie_course TEXT, 
        vegie_prep INTEGER, 
        vegie_cal INTEGER,
        vegie_servings INTEGER,
        vegie_ingredients TEXT,
        vegie_instructions TEXT)""")

        cur.execute("""CREATE TABLE IF NOT EXISTS dairy(
        dairy_id integer PRIMARY KEY, 
        dairy_name TEXT, 
        dairy_course TEXT, 
        dairy_prep INTEGER, 
        dairy_cal INTEGER,
        dairy_servings INTEGER,
        dairy_ingredients TEXT,
        dairy_instructions TEXT)""")

        cur.execute("""CREATE TABLE IF NOT EXISTS dessert(
        dessert_id integer PRIMARY KEY, 
        dessert_name TEXT, 
        dessert_course TEXT, 
        dessert_prep INTEGER, 
        dessert_cal INTEGER,
        dessert_servings INTEGER,
        dessert_ingredients TEXT,
        dessert_instructions TEXT)""")


        conn.commit()

        conn.close()

x = Gen()
x.gen2()
