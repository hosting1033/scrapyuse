# -*- coding: utf-8 -*-
"""
Created on Fri Feb 16 05:33:25 2018

@author: Project
"""

# -*- coding: utf-8 -*-
"""
Created on Tue Feb  6 16:14:39 2018
@author: Project
"""
from sqlalchemy import create_engine
from datetime import datetime
import uuid

engine = create_engine("mysql+mysqlconnector://root:321@localhost/drones")
date_time = datetime.now()

#Write data to drone table
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
engine.execute(add_drone, data_drone)

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
engine.execute(add_sale, data_sale)

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
engine.execute(add_review, data_review)

# Test output
test_sql = ("""
       SELECT d.updated_at, d.id, s.id, r.id FROM drone d join sale s join review r
       on  d.id = s.drone_id and  d.id = r.drone_id
       where d.id != s.id and  s.id != r.id
       ORDER BY d.updated_at DESC LIMIT 1
       """)
result = engine.execute(test_sql)
data = result.fetchall()
print(data)