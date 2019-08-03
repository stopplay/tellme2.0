import requests
from bs4 import BeautifulSoup
import json
import re

def get_sku_by_slm_url(slm_url):
    slm_html = requests.get(slm_url)
    content_html_object = BeautifulSoup(slm_html.text, features='lxml')
    return parse_sku_from_html(content_html_object)

def parse_sku_from_html(html_object):
    sku = ''
    scripts = html_object.find_all('script', {'type': 'application/ld+json'})
    for script in scripts:
        try:
            data_object = json.loads(script.get_text())
            sku = data_object['sku']
        except:
            pass

    if sku == '':
        div_object = html_object.find('div', {'class':'product-sku'})
        sku = re.sub('\D', '', div_object.get_text())
    return sku