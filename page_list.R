library(httr2)
library(rvest)
req <- 
  request("https://scrapbox.io/") |> 
  req_url_path_append("api/pages/") |> 
  req_url_path_append("mandaRa")
x <-
  req |>
  req_perform() |>
  resp_body_json()
cat(sprintf("総ページ数: %d", x$count))
# [todo] 100ページをこえた場合は、次のページを取得するように
# skipとlimitパラメータを使って制御
# df_pages <- 
#   tibble::tibble(
#     name = x$pages |>
#       purrr::map_chr("title")
#   )

x |> 
  jsonlite::toJSON(auto_unbox = FALSE) |> 
  jsonlite::write_json("data-raw/pages.json")

