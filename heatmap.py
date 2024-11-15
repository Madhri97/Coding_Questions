import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load the data from the TSV file
df = pd.read_csv('demo_data.tsv', sep='\t')

# Create the heatmap
plt.figure(figsize=(8, 6))
sns.heatmap(df, annot=True, cmap='YlOrRd')
plt.title('Heatmap')
plt.xlabel('X')
plt.ylabel('Y')
plt.savefig('heatmap.png')
plt.show()

