import requests
from bs4 import BeautifulSoup

response = requests.get('https://finance.naver.com/marketindex/?tabSel=exchange#tab_section').text
soup = BeautifulSoup(response, 'html.parser')
exchange_rate = soup.select_one('#exchangeList > li.on > a.head.usd > div > span.value').text
print(exchange_rate)
