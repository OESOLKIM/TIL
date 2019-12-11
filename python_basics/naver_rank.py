import requests
from bs4 import BeautifulSoup

response = requests.get('https://www.naver.com/').text
soup = BeautifulSoup(response, 'html.parser')

tags = soup.select('#PM_ID_ct > div.header > div.section_navbar > div.area_hotkeyword.PM_CL_realtimeKeyword_base > div.ah_roll.PM_CL_realtimeKeyword_rolling_base > div > ul .ah_k')
with open('naver_rank_top20.txt', 'w', encoding='utf-8') as f:
    f.write('네이버 검색어 순위 \n')
    for idx, tag in enumerate(tags):
        f.write(f'{idx+1}. {tag.text} \n')

