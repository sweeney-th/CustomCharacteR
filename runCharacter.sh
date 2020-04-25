#!/bin/bash

# start the live apps
R -e "shiny::runApp('apps/testApp.R', port = 8000)" &

# build the book
R -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

echo "enter to password to shutdown ports"

sudo kill -9 `sudo lsof -t -i:8000`