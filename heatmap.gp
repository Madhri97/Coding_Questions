

#Set the terminal type and output file
set terminal postscript eps color enhanced size 6,6 font 'Arial,15'
set output "big_matrix.eps"

#Set the data file
set datafile separator '\t'
set datafile missing '-'

#Plot the heatmap
set title 'Heatmap'
set xlabel 'X'
set ylabel 'Y'
splot 'demo_data.tsv' matrix with image
