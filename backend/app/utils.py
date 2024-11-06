from flask import Flask, jsonify
from flask_cors import CORS
import requests 
from bs4 import BeautifulSoup

app = Flask(__name__)
CORS(app)

def get_notices_from_skk_website(url_pattern, max_pages):

    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }

    notices = [] 
    for page_num in range(1, max_pages + 1):
        url = url_pattern.format(page_num)  
        response = requests.get(url, headers=headers)
    
        if response.status_code != 200:
            print(f"HTTP 상태 코드: {response.status_code}")
            return None

        soup = BeautifulSoup(response.text, 'html.parser')

        ul_tags = soup.find_all('ul', class_='board-list-wrap') 

        for ul in ul_tags:
            li_tags = ul.find_all('li')
            for item in li_tags:
                title_tag = item.find('dt', class_='board-list-content-title')
                if title_tag:
                    spans_and_a = title_tag.find_all(['span', 'a'])
                
                    title_parts = []
                    for tag in spans_and_a:
                        title_parts.append(tag.get_text(strip=True))
                    if len(title_parts)==3:
                        title_parts.pop()
                    title = " ".join(title_parts)

                    link_tag = title_tag.find('a')
                    if link_tag:
                        url = link_tag.get('href')

                info_tag = item.find('dd', class_='board-list-content-info')
                if info_tag:
                    info_li_tags = info_tag.find('ul').find_all('li')
                    for info_li in info_li_tags:
                        if "-" in info_li.get_text():
                            date = info_li.get_text(strip=True)
                        elif "조회수" in info_li.get_text():
                            views = info_li.get_text(strip=True)
                            views= views.replace('조회수', '')

                    notices.append({
                        'title': title,
                        'url': url,
                        'date': date,
                        'views': views
                    })
    return notices

@app.route('/notices', methods=['GET'])
def get_notices():
    url_pattern = 'https://www.skku.edu/skku/campus/skk_comm/notice01.do?mode=list&&articleLimit=10&article.offset={0}'
    notices = get_notices_from_skk_website(url_pattern, max_pages=10)
    return jsonify(notices)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)