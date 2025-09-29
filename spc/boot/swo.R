library(TAF)

repo <- file.path("https://raw.githubusercontent.com/PacificCommunity",
                  "/ofp-sam-swo-2025-diagnostic/refs/heads/main/TAF/output")

download(file.path(repo, "f_area.csv"))
download(file.path(repo, "natage.csv"))
