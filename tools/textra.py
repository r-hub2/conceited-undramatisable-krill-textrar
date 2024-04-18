"""
Sample Python3 OAuthRequest
"""

from requests_oauthlib import OAuth2Session
from oauthlib.oauth2 import BackendApplicationClient
import requests as req

NAME   = 'matutosi' # ログインID
KEY    = 'a29cc8f354295844ce9443a0f00035630630a61e1' # API key
SECRET = 'eeb35c54c9483afcd51362d9bcc558e4' # API secret
URL    = 'https://mt-auto-minhon-mlt.ucri.jgn-x.jp' # 基底URL (https://xxx.jpまでを入力)

api_name  = 'mt' # API名 (https:#xxx.jp/api/mt/generalNT_ja_en/ の場合は、"mt")
api_param = 's-7345_ja_en' # API値 (https:#xxx.jp/api/mt/generalNT_ja_en/ の場合は、"generalNT_ja_en")

text = "今日はいい天気です．"  # 翻訳する文章

client = BackendApplicationClient(client_id=KEY)
oauth = OAuth2Session(client=client)

token_url = URL + '/oauth2/token.php'
token = oauth.fetch_token(token_url = token_url, client_id = KEY, client_secret = SECRET)

try:
    params = {
        'access_token': token['access_token'],  # アクセストークン
        'key'         : KEY,                    # API key
        'name'        : NAME,                   # ログインID
        'api_name'    : api_name,               # API名
        'api_param'   : api_param,              # API値
        'text'        : text                    # 
        # 'xxx'       : 'xxx',                  # 以下、APIごとのパラメータ
    }
    res = req.post(URL + '/api/?', data=params)
    res.encoding = 'utf-8'
    print("[res]")
    print(res)
    print(res.text)
except Exception as e:
    print('=== Error ===')
    print('type:' + str(type(e)))
    print('args:' + str(e.args))
    print('e:' + str(e))
