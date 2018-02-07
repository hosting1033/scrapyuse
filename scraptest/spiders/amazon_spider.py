# -*- coding: utf-8 -*-

import scrapy


class AmazonSpider(scrapy.Spider):
    name = "amazon"

    def start_requests(self):
        urls = [
            'https://www.amazon.com/Complete-Charging-Station-Xbox-One/dp/B01J36HGVC/ref=xs_gb_rss_A1R7LOCTKCL8AP/?ccmID=380205&tag=rssfeeds-20',            
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        page = response.url.split("/")[-2]
        print(page)
        self.log(page)