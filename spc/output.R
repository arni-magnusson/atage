# Extract results of interest, write CSV output tables

# Before: alb_f.csv, alb_n.csv,
#         bet_f.csv, bet_n.csv,
#         skj_f.csv, skj_n.csv,
#         yft_f.csv, yft_n.csv (model)
# After:  alb_f.csv, alb_n.csv,
#         bet_f.csv, bet_n.csv,
#         skj_f.csv, skj_n.csv,
#         yft_f.csv, yft_n.csv (output)

library(TAF)

mkdir("output")

# Copy tables
cp("model/*.csv", "output")
