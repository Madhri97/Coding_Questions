#First few lines from input data:

-1118	1.27553239271999	Cl1
-1117	1.27696343296042	Cl1
-1116	1.27829211888462	Cl1
-1115	1.27953030556019	Cl1
-1114	1.28067189848055	Cl1


library(ggplot2)
library(dplyr)

# Read the command-line arguments
args <- commandArgs(trailingOnly = TRUE)
output_file <- args[1]
x_axis_label <- args[2]
y_axis_label <- args[3]
plot_title <- args[4]



# Read the data from standard input
data <- read.table(file("stdin"), header = FALSE, sep = "\t", col.names = c("x_value", "y_value", "category"))

line_width <- 0.8

# Create the plot
p <- ggplot(data, aes(x = x_value, y = y_value, color = category, group = category)) +
  geom_line(linewidth = 1.2) +
  geom_point() +
  labs(
    title = plot_title,
    x = x_axis_label,
    y = y_axis_label
  ) +
  theme(
    panel.background = element_rect(fill = "white", color = "white"), # White background
    panel.grid.major = element_blank(),  # Remove major gridlines
    panel.grid.minor = element_blank(),  # Remove minor gridlines
    axis.line = element_line(color = "black"),  # Add black axes
    legend.title = element_blank(),  # Remove the legend title
    legend.key = element_blank()  # Optional: remove the legend background
  )

# Save the plot
ggsave(output_file, plot = p, width = 8, height = 6, dpi = 300)
