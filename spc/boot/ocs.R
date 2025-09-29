library(TAF)

repo <- file.path("https://raw.githubusercontent.com/PacificCommunity",
                  "/ofp-sam-ocs-2025-diagnostic/refs/heads/main/TAF/output")

download(file.path(repo, "fishmort.csv"))
download(file.path(repo, "natage.csv"))
