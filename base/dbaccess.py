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

#Write data to drone table
date_time = datetime.now()

d_id = str(uuid.uuid1())

add_drone = ("""
        INSERT INTO drone (id, model, brand, info_by_manufacturer, motion_type, 
        material, kit_type, area, impl_field, level, age, created_at, updated_at 
        ) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """)
data_drone = (
        d_id, 'drone 00+', 'manufacturer name', 'manufacturer country', 'quadcopter', 
        'plastic', 'ready', 'indoor', 'joy', 'beginners', 'kids', 
        date_time, date_time
        )
cursor.execute(add_drone, data_drone)

#Write data to sale table
s_id = str(uuid.uuid1())

add_sale = ("""
        INSERT INTO sale (id, price, provider_name, dron_full_name, descr, 
        spec, shipping_info, customer_rating, number_of_reviews, 
        number_of_questions, id_by_provider, url, drone_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """)

data_sale = (
        s_id, 350.02, 'amazon', 'Bazzz ooo', 'it flies and makes video', 
        'tech detailes', 'dimensions weight sale abroad', 5, 600, 
        300, 'B071LQGXXF', 'amazon.com', d_id
        )
                     
cursor.execute(add_sale, data_sale)

#Write data to review table
r_id = str(uuid.uuid1())

add_review = ("""
        INSERT INTO review (id, rate_by_author, headline, content, 
        author, number_of_comments, date_of_review, sale_id, drone_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """)

data_review = (
        r_id, 5, 'title text', 'text of review', 'alexander', 
        5, '2018-02-09 16:26:35', s_id, d_id
        )
                     
cursor.execute(add_review, data_review)

# Make sure data is committed to the database
cnx.commit()

# Last row output
sql = ("""
       SELECT * FROM drone join sale join review
       on  drone.id = sale.drone_id
       where drone.id = review.drone_id
       ORDER BY drone.updated_at DESC LIMIT 1
       """)

cursor.execute(sql)
data = cursor.fetchall()
print(data)

cursor.close()
cnx.close()