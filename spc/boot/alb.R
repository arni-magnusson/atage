library(TAF)

repo <- file.path("https://raw.githubusercontent.com/PacificCommunity",
                  "/ofp-sam-alb-2024-diagnostic/refs/heads/main/TAF/output")

download(file.path(repo, "f_annual.csv"))
download(file.path(repo, "natage.csv"))
