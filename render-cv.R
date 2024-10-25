#!/usr/bin/env Rscript

# gets today's date to append to the final pdf
date <- stringr::str_extract_all(lubridate::date(), pattern = "(?<=\\w{3}\\s)\\w{3}|\\d{4}", simplify = TRUE) |>
        stringr::str_flatten()

# generates the html page
rmarkdown::render(input = "cv.Rmd",
                  output_file = "index.html")

#generates the pdf file
pagedown::chrome_print(input = "index.html",
                       output = glue::glue("guilherme_viana_cv_{date}.pdf"),
                       wait = 1, options = list(scale = 0.7))
