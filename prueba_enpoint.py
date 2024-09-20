import requests

url ="http://18.212.121.39:8000/v1/prediction"
      
json = {
    'opening_gross':8330681,
    'screens':2271,
    'production_budget':13000000,
    'title_year':2019,    
    'aspect_ratio':1.85,
    'duration':97,
    'cast_total_facebook_likes':37907,
    'budget':16000000,
    'imdb_score':7.2
    }

response = requests.post(url=url, json=json)

print(response.text)