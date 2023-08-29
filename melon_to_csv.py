import time
​
import pandas as pd
from bs4 import BeautifulSoup
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
​
def main():
​
    '''
       100곡의 음원 id 값 뽑기
       해당 id값으로 각 음악의 속성값을 접근
       ex) https://www.melon.com/song/detail.htm?songId=36599950
    '''
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
    }
​
    baseurl = 'https://www.melon.com/chart/month/index.htm?classCd=GN0'
    youtube_base_search = 'https://www.youtube.com/results?search_query='
    url_std = 'https://www.melon.com/song/detail.htm?songId='
​
    # Google API 키
    API_KEY = 'AIzaSyAjaSpx49SQscQnkyVdBiaUNSIIXJK7mZI'
​
    # 각종 음악 정보 담을 리스트
    song_ids = []
    title_list = []
    album_list = []
    artist_list = []
    lyrics_list = []
    genre_list = []
    album_path_list = []
    public_dt_list = []
    youtube_link_list=[]
​
    # 음악 장르별(8개)사이트
    for seq in range(1,9):
        '''
            1 : 발라드
            2 : 댄스
            3 : 랩/힙합
            4 : R&B/Soul
            5 : 인디음악
            6 : 록/메탈
            7 : 트로트
            8 : 포크/블루스
        '''
​
        url = baseurl + str(seq) + '00'
        #print(url)
​
        browser = webdriver.Chrome()
        browser.get(url)
​
        # 멜론차트 사이트의 달력 버튼 클릭(드라이브)
        calendar_button = browser.find_element(By.CSS_SELECTOR, 'button[class="button_icons etc arrow_d"]')
        calendar_button.click()
​
        # 6월달 선택
        june_button = browser.find_element(By.CSS_SELECTOR, 'a[data-date="202306"]')
        june_button.click()
​
        # 6월달 선택한 후 20초 로딩시간 대기
        time.sleep(20)
​
        # 현재 페이지 소스 가져오기
        html = browser.page_source
        soup = BeautifulSoup(html, "lxml")
​
        # music_id 값 가져오기
        song_entries = soup.find_all('tr')
​
        # music_id
        for entry in song_entries:
            # songid를 포함하는 속성 값을 가져옵니다. 일반적으로 'data-song-no' 또는 'data-song-no-href'와 같은 속성에 저장되어 있습니다.
            songid = entry.get('data-song-no')
            if songid:
                song_ids.append(songid)
                url = url_std + songid
​
                response = requests.get(url, headers=headers)
                soup = BeautifulSoup(response.text, "html.parser")
​
                # 제목
                title = soup.find('strong', class_='none').next_sibling.strip()
                print(title)
​
                # 아티스트
                artist = soup.find('div', class_='artist').get_text()
                artist = artist.strip()  # 앞뒤 공백 및 줄바꿈 제거
​
                # 앨범명
                album_dt = soup.find('dt', text='앨범')
                album_name = album_dt.find_next('dd').find('a').get_text()
​
                # 가사
                lyrics_tag = soup.find('div', class_='lyric')
                if lyrics_tag:
                    lyrics = lyrics_tag.get_text(separator='<br>').strip()  # <br> 태그를 줄바꿈 문자로 바꿈
                    lyrics = lyrics.strip()  # 앞뒤 공백 및 줄바꿈 제거
                else:
                    lyrics = "가사 정보 없음"
​
                # 장르
                genre_tag = soup.find('dl', class_='list')
                if genre_tag:
                    genre = genre_tag.find_all('dd')[2].get_text()
                else:
                    genre = "장르 정보 없음"
​
                # 발매일
                public_dt_tag = soup.find('dl', class_='list')
                if public_dt_tag:
                    public_dt = public_dt_tag.find_all('dd')[1].get_text()
                    public_dt_replace = public_dt.replace('.', '/')
                else:
                    public_dt_replace = "발매일 정보 없음"
​
                # 앨범사진
                image_tag = soup.find('div', class_='thumb')
                image_url = image_tag.find('img')['src']
​
                #유튜브 임베드 링크
                search_query = artist + ' ' + title
                search_query = search_query.replace(' ', '+')
​
                #YouTube Data API에 요청
​
                search_url = f'https://www.googleapis.com/youtube/v3/search?key={API_KEY}&q={search_query}&maxResults=1&type=video'
​
                response = requests.get(search_url)
                '''
                response{
                  "kind": "youtube#searchListResponse",
                  "etag": "U77DB1Unj1fijfZ1XRSUvp0-jGg",
                  "nextPageToken": "CAEQAA",
                  "regionCode": "KR",
                  "pageInfo": {
                    "totalResults": 160889,
                    "resultsPerPage": 1
                  },
                  "items": [
                    {
                      "kind": "youtube#searchResult",
                      "etag": "ZweMQ5a18pOJSXsEe5xf281_ND0",
                      "id": {
                        "kind": "youtube#video",
                        "videoId": "EYzgL19wj2g"
                      }
                    }
                  ]
                }
​
                '''
                data = response.json()
                # data{'kind': 'youtube#searchListResponse', 'etag': 'U77DB1Unj1fijfZ1XRSUvp0-jGg', 'nextPageToken': 'CAEQAA', 'regionCode': 'KR', 'pageInfo': {'totalResults': 160889, 'resultsPerPage': 1},
                # 'items': [{'kind': 'youtube#searchResult', 'etag': 'ZweMQ5a18pOJSXsEe5xf281_ND0', 'id': {'kind': 'youtube#video', 'videoId': 'EYzgL19wj2g'}}]}
​
                if 'items' in data and data['items']:  # 'items' 키가 존재하고 비어있지 않은지 확인
                    video_id = data['items'][0]['id']['videoId']
                    youtube_url = f'https://www.youtube.com/embed/{video_id}'
                else:
                    youtube_url = None  # 또는 다른 기본 값으로 설정
​
                title_list.append(title)
                album_list.append(album_name)
                artist_list.append(artist)
                lyrics_list.append(lyrics)
                genre_list.append(genre)
                album_path_list.append(image_url)
                public_dt_list.append(public_dt_replace)
                youtube_link_list.append(youtube_url)
​
​
    df = pd.DataFrame({'music_id' : song_ids, 'title' : title_list, 'album' : album_list, 'artist' : artist_list, 'lyrics' : lyrics_list, 'genre' : genre_list, 'album_path' : album_path_list, 'public_dt' : public_dt_list, 'yt_link' : youtube_link_list})
    print(df)
    df.to_csv('melon_06_chart_to_csv.csv', index=False)
​
​
​
main()
