# Exclure du paquet le devhistory
usethis::use_build_ignore("dev_history.R")

# Licence

usethis::use_agpl3_license()



#usethis::use_pipe(export = FALSE)
#usethis::use_package("plotly")
usethis::use_package("assertthat")

usethis::use_vignette("NPS_dognuts")
usethis::use_r("NPS_dognuts.R")
usethis::use_test("NPS_dognuts.R")



devtools::build(vignettes = TRUE)
#check dev
devtools::check()

usethis::use_readme_rmd()
devtools::build_readme()

usethis::use_github_action()






#check dev
devtools::check()
