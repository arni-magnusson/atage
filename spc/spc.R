fetch <- function(file, url, quiet=TRUE)
{
  if(file.exists(file))
  {
    if(!quiet)
      message(file, " already exists")
  }
  else
  {
    download.file(url, file)
  }
}

yft <- file.path("https://raw.githubusercontent.com/PacificCommunity",
                 "/ofp-sam-yft-2023-diagnostic/refs/heads/main/TAF/output")

yft.f <- file.path(yft, "f_season.csv")

yft.n <- file.path(yft, "natage.csv")

fetch("yft_2023_natage.csv", yft.n)
fetch("yft_2023_fatage.csv", yft.f)

n <- read.csv("yft_2023_natage.csv")
f <- read.csv("yft_2023_fatage.csv")

################################################################################

f <- f[f$area == "all",]
f <- aggregate(f~year+age, f, sum)
f$area <- NULL

n <- aggregate(n~year+age, n, sum)
n$n <- n$n / 1e6
