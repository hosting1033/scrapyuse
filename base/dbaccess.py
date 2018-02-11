# -*- coding: utf-8 -*-
"""
Created on Tue Feb  6 16:14:39 2018
@author: Project
"""
from datetime import datetime
import mysql.connector
import uuid
cnx = mysql.connector.connect(host="localhost", user="root", 
                           passwd="321", db="drones")
cursor = cnx.cursor()

date_time = datetime.now()

unic_id = uuid.uuid4().hex

add_drone = ("""
        INSERT INTO drone (model, brand, motion_type, manufacturer_info, 
        kit_type, area, impl_field, level, age, created_at, updated_at, 
        drone_id) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """)
data_drone = ('drone 00+', 'brand name', 'copter', 'manufacturer + country', 
        'ready', 'both', 'joy', 'expert', 'adult', 
        date_time, date_time, unic_id
        )
cursor.execute(add_drone, data_drone)

add_sale = ("""
        INSERT INTO sale (price, provider_name, dron_full_name, descr, 
        specification, shipping_info, customer_rating, number_of_reviews, 
        number_of_questions, drone_article, url, sale_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """)

data_sale = (
        '350.02', 'amazon', 'Bazzz ooo', 'it flies and makes video', 
        'tech detailes', 'dimensions weight sale abroad', 5, 600, 
        300, 'Amazon_ID', 'amazon.com', unic_id
        )
                     
cursor.execute(add_sale, data_sale)

add_review = ("""
        INSERT INTO review (author_rate, title, text, author, 
        number_of_comments, review_date, review_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """)

data_review = (5, 'title text', 'text of review', 'alexander', 
        5, '2018-02-09 16:26:35', unic_id
        )
                     
cursor.execute(add_review, data_review)

# Make sure data is committed to the database
cnx.commit()

# Last row output
sql = ("""
       SELECT * FROM drone join sale join review
       on  drone.drone_id = sale.sale_id
       where drone.drone_id = review.review_id
       ORDER BY drone.updated_at DESC LIMIT 1
       """)

cursor.execute(sql)
data = cursor.fetchall()
print(data)

cursor.close()
cnx.close()