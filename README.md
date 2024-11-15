
**Q1: Selecting lines from stdin (Python Code + Linux Command)**

Python script reads patterns from a file provided as a command-line argument and then filters and prints lines from the standard input (stdin) that contain any of those patterns.

#To add the comment from files at top of the file in vim :
:r! zcat q1_data.tsv.gz | head -n 5 | sed 's/^/\/\/ /'

#To run the script 
zcat q1_data.tsv.gz | python select_lines.py to_select.tsv > matched_lines.tsv

#To just get the ouput using the awk command:
zcat q1_data.tsv.gz | awk 'NR==FNR {patterns[$0]; next} NR>FNR {for (i=1; i<=NF; i++) if ($i in patterns) {print; next}}' to_select.tsv - > output_file.tsv


**Q2: Plotting a group of lines ( R + Linux Command)**

This R script reads a tab-separated dataset from standard input, where each row has x_value, y_value, and category. It then uses ggplot2 to create a line plot with points, grouped by category, and customizes the appearance (removes gridlines, adds black axes). Finally, it saves the plot to a specified output file with custom axis labels and title.

#To run the script:
cat q2_data.tsv | Rscript plot_gp_lines.R "different_clusters.png" "Relative from center [bp],Enrichment over Mean,MNase fragment profile"

**Q3: Merge multiple files (R + Linux Command)**

This R script processes multiple tab-separated files specified in a list, joins them based on a common column (id), and outputs the resulting merged data to the standard output using an inner join

args[1]: A file path (file_list_path) that contains a list of file paths (one per line)

#To run the script :
Rscript join_files.R list_q3.tsv  > join_output.tsv


**Q4: Label with quantiles (Python)**

This script takes a list of numerical values, groups them into quantiles, and outputs the value along with its assigned quantile and the corresponding bin range.

Usage
The script reads data from standard input and splits it into the specified number of quantiles. For each value, it outputs the value, its quantile, and the bin range it belongs to.
#to run the script:
cat first_hundred_numbers.tsv | python label_with_quantiles.py 4



**Q5: Plotting big matrix (Linux + Gnuplot)**

To plot the large the matrix to a haetamp,the data was convetred only in numerical foramt and string Id (First colum) is removed

#command to get demo data:
zcat big_data.tsv.gz | cut -f2- > demo_data.tsv

Gnuplot script is used to get the .eps uisng command: gnuplot heatmap.gp

big_matrix.eps is converted to big_matrix.pdf using ps2pdf: ps2pdf big_matrix.eps big_matrix.pdf

The heatmap is generated using the python code heatmap.py
 

