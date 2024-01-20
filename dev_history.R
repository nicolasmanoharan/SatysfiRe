# Exclure du paquet le devhistory
usethis::use_build_ignore("dev_history.R")

# Licence

usethis::use_agpl3_license()


#check dev
devtools::check()

usethis::use_readme_rmd()
devtools::build_readme()

usethis::use_github_action()






#check dev
devtools::check()
