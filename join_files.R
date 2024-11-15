#file list: 

q3_first.tsv
q3_second.tsv

#output should look like this:

81d92351-c619-4585-9281-de33eaaabba4	TCGA-38-7271-01A	Primary Tumor	13.6971
2e5071ce-d8cf-46e5-9cc0-91353f0d643c	TCGA-55-7914-01A	Primary Tumor	24.8212
d3f1b81f-37ce-47b6-b98d-8530076007c7	TCGA-95-7043-01A	Primary Tumor	15.7251
c568fdc8-6942-44ff-a9d9-3f7a03fdc62a	TCGA-73-4658-01A	Primary Tumor	61.6106
dd6ec250-8d4d-4129-9664-7451c1760f4b	TCGA-86-8076-01A	Primary Tumor	28.685


# Set the CRAN mirror
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# Install tidyverse package if it's not already installed
if (!require("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
  library(tidyverse)
}

# Read the command-line argument for the list of files
args <- commandArgs(trailingOnly = TRUE)
file_list_path <- args[1]

# Read the list of files from the file list (a list of file paths)
file_list <- read_lines(file_list_path)


data_frames <- map(file_list, function(file) {
  read_tsv(file, col_names = FALSE)
})

data_frames <- lapply(data_frames, function(df) {
  colnames(df) <- c("id", "sample", "type")  # Adjust based on the expected structure
  return(df)
})

joined_data <- reduce(data_frames, function(x, y) inner_join(x, y, by = "id"))

# Output to stdout (console)
write.table(joined_data, row.names = FALSE, col.names = FALSE, sep = "\t", quote = FALSE)
