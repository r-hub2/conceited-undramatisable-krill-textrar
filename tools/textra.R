## textrar
  # https://mt-auto-minhon-mlt.ucri.jgn-x.jp/
library(httr)
library(jsonlite)

  # 定義
NAME <- "matutosi" # ログインID
KEY <- "a29cc8f354295844ce9443a0f00035630630a61e1" # API key
SECRET <- "eeb35c54c9483afcd51362d9bcc558e4" # API secret
URL <- "https://mt-auto-minhon-mlt.ucri.jgn-x.jp" # 基底URL (https://xxx.jpまでを入力)

  # https://mt-auto-minhon-mlt.ucri.jgn-x.jp/api/mt/transLM_ja_en/
api_name <- "mt" # API名 (https:#xxx.jp/api/mt/generalNT_ja_en/ の場合は、"mt")
api_param <- "transLM_ja_en" # API値 (https:#xxx.jp/api/mt/generalNT_ja_en/ の場合は、"generalNT_ja_en")

  # https://mt-auto-minhon-mlt.ucri.jgn-x.jp/api/mt_standard/get/
api_name <- "mt_standard" # API名 (https:#xxx.jp/api/mt/generalNT_ja_en/ の場合は、"mt")
api_param <- "get" # API値 (https:#xxx.jp/api/mt/generalNT_ja_en/ の場合は、"generalNT_ja_en")
lang_s <- "ja"
lang_t <- "en"

text <- "吾輩は猫である．今日はいい天気です．" # 翻訳する文章
type <- "json"
encoding <- "UTF-8"

  # トークン取得
token_url <- paste0(URL, "/oauth2/token.php")
token_req <- httr::POST(
  url = token_url,
  body = list(
    client_id = KEY,
    client_secret = SECRET,
    grant_type = "client_credentials"
  ),
  encode = "form",
  config = httr::config(ssl_verifypeer = FALSE)
)
token <- 
  jsonlite::fromJSON(
    httr::content(token_req, "text", encoding = "UTF-8"))$access_token

  # リクエスト送信
params <- 
  list(
    access_token = token,
    key = KEY,
    name = NAME,
    api_name = api_name,
    api_param = api_param,
    text = text, 
    limit = "1000",
    lang_s = lang_s,
  #     lang_t = lang_t,
    type = type)

res <- 
  httr::POST(
    url = paste0(URL, "/api/?"),
    body = params,
    encode = "form",
    config = httr::config(ssl_verifypeer = FALSE))

## 
  # 結果処理
if(res$status_code == 200){
  print("Success")
}else{
  cat("=== Error ===\n")
  cat("status_code:", res$status_code, "\n")
  cat("content:", httr::content(res, "text", encoding = encoding), "\n")
}

res_list <- 
  res |>
  httr::content("text", encoding = encoding) |>
  jsonlite::fromJSON()

ids <- res_list$resultset$result$list$id
langs <- unique(res_list$resultset$result$list$lang_t)

  # 汎用NT "generalNT"
  # 特許NT "patentNT"
  # 対話NT(音声翻訳エンジン専用)     "voicetraNT"
  # FSA  "fsaGoJP"
  # 金融NT     "fsaNT" 
  # 法令契約NT "lawsNT"
  # みん翻PE       "minnaPE" 
  # ニュース   "news"    
  # 【新エンジン試行中】特許LM "patentLM"   
  # 特許拒絶理由・審決等  "patETC"    
  # 日常会話    "seikatsu" 
  # サイエンス  "science"     
  # 【新エンジン試行中】翻訳LM "transLM" 
 
res_list$resultset$result$text

  # 以下でも同じ
  # res |>
  #   httr::content("text", encoding = encoding) |>
  #   jsonlite::fromJSON() |>
  #   `$`(_, "resultset") |> # chuck("resultset")
  #   `$`(_, "result") |>
  #   `$`(_, "text")
  # 
  # jsonlite::fromJSON(httr::content(res, "text", encoding = encoding))$resultset$result$text
