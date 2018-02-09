date_time = datetime.now()

add_drone = ("""
        INSERT INTO drone (model, brand, motion_type, manufacturer_info, 
        kit_type, area, impl_field, level, age, created_at, updated_at) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """)
data_drone = ('drone 001', 'mybrand', 'copter', 'something', 
        'ready', 'both', 'joy', 'expert', 'adult', date_time, date_time
        )
cursor.execute(add_drone, data_drone)

current_id = cursor.lastrowid

add_sale = ("""
        INSERT INTO sale (price, provider_name, dron_full_name, descr, 
        specification, shipping_info, customer_rating, number_of_reviews, 
        number_of_questions, drone_article, url, drone_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """)

data_sale = (
        '350.02', 'amazon', 'Bazzz ooo', 'so en so...', 
        'some more tech detailes', 'dimensions weight destination', 2, 567, 
        300, 'xz', 'amazon.com', current_id
        )
                     
cursor.execute(add_sale, data_sale)

current_id = cursor.lastrowid

add_reviwe = ("""
        INSERT INTO review (author_rate, title, text, author, 
        number_of_comments, review_date, sale_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """)

data_reviwe = (5, 'zzz', 'once upon a time', 'alexander', 
               500, '2018-02-09 16:26:35', current_id
               )
                     
cursor.execute(add_reviwe, data_reviwe)

# Make sure data is committed to the database
cnx.commit()

# Last row output
sql = ("""
       SELECT * FROM drone
       ORDER BY drone.id DESC LIMIT 1
       """)

cursor.execute(sql)
data = cursor.fetchall()
print(data)

cursor.close()
cnx.close()