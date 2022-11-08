install.packages(c("knitr","rmarkdown", "devtools"))

# register the repositories for The Carpentries and CRAN
options(repos = c(
  carpentries = "https://carpentries.r-universe.dev/",
  CRAN = "https://cran.rstudio.com/"
))

# Install the template packages to your R library
install.packages(c("sandpaper", "varnish", "pegboard", "tinkr"))

# devtools did work so I had to use remotes Thanks @
install.packages("remotes")
remotes::install_github("carpentries/sandpaper") # this will auto-update pegboard and tinkr if needed
remotes::install_github("carpentries/varnish")

# test installation
rmarkdown::pandoc_version()
tmp <- tempfile()
sandpaper::no_package_cache()
sandpaper::create_lesson(tmp, open = FALSE)
sandpaper::build_lesson(tmp, preview = FALSE, quiet = TRUE)
fs::dir_tree(tmp, recurse = 1)
