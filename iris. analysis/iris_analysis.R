# phase 1

data(iris)
head(iris)
str(iris)
anyNA(iris)
summary(iris)
colnames(iris)

# phase 2

colMeans(iris[, 1:4])
apply(iris[, 1:4], 2, median)   # Median
apply(iris[, 1:4], 2, min)      # Minimum
apply(iris[, 1:4], 2, max)      # Maximum
apply(iris[, 1:4], 2, sd)
cor(iris[, 1:4])
install.packages("corrplot")
library(corrplot)

# Create the correlation matrix
cor_matrix <- cor(iris[, 1:4])

# Visualize it with corrplot
corrplot(cor_matrix, method = "color", type = "upper", addCoef.col = "black")

# --- Phase 2 Summary ---
# The petal measurements (length & width) have a very strong positive correlation.
# Sepal length is also strongly correlated with petal size.
# Sepal width shows weak or negative correlation with other features.
# These relationships suggest that petal features are better predictors of species.


# phase 3 

library(ggplot2)
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.3, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Sepal Length", x = "Sepal Length", y = "Count")
# Save it to file

ggsave("histogram_sepal_length.png")


ggplot(data = iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Sepal Length by Species", x = "Species", y = "Sepal Length") +
  theme_minimal()
# Save it to file

ggsave("boxplot_sepal_length.png")



ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Petal Length vs Petal Width by Species", x = "Petal Length", y = "Petal Width") +
  theme_minimal()
# Save it to file

ggsave("scatter_petal_length_width.png", width = 6, height = 4, dpi = 300)


ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point(color = "steelblue", size = 2) +
  facet_wrap(~ Species) +
  labs(title = "Petal Dimensions by Species", x = "Petal Length", y = "Petal Width") +
  theme_minimal()
# Save it to file

ggsave("facet_species_plot.png", width = 8, height = 4)

# --- Phase 3 Summary ---
# Histograms helped visualize the distribution of flower features.
# Boxplots revealed that Setosa has clearly smaller Sepal.Length, with a few outliers.
# Scatter plots showed that Petal.Length and Petal.Width are highly effective at separating species.
# Faceted plots confirmed that Setosa forms a distinct cluster, while Versicolor and Virginica are moderately overlapping but still distinguishable.

---------------------------------------------------------------

# --- Final Summary ---

# The Iris dataset contains three species of flowers with distinct characteristics.
# Through exploratory analysis, we found that:
# - Petal length and petal width are highly effective at separating species.
# - Setosa is clearly distinct from the other two in almost all features.
# - Versicolor and Virginica overlap slightly but can still be distinguished based on petal size.
# - There are no missing values, and the data is clean and balanced.
# - Histograms and boxplots revealed differences in distributions and outliers.
# - Scatter plots visually confirmed separability of species clusters.
# These insights suggest petal features are reliable for classifying flower species












