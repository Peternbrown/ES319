library(ggplot2)
library(tidyr)

# Load the dataframe
camvult <- read.csv("cambodian-vultures.csv")

# Widen the margins of the boxplot
par(mar = c(5, 8, 5, 5))

# Create the box plot ----
boxplot(camvult$RHV.nests, camvult$RHV.fledged, camvult$WRV.nests, camvult$WRV.fledged,
        main = "Comparison of Red-headed Vulture and White-rumped Vulture nest spottings and 
                fledges in Cambodia",
        at = c(1, 2, 3, 4),
        names = c("RHV nests", "RHV fledged", "WRV nests", "WRV fledged"),
        las = 1,
        col = c("red", "red", "white", "white"),
        border = "black",
        horizontal = TRUE)

# convert to a long table
camvultlong <- pivot_longer(camvult, cols = -Year, names_to = "Vulture",
                            values_to = "Number_Spotted")

# Plot by year ----
ggplot(camvultlong, aes(x = Year, y = Number_Spotted, ylab = "Number Recorded", color = Vulture)) + 
        geom_bar(stat = "identity", position = "dodge", fill = "white") +
        labs(y = "Number Recorded", colour = "Type Recorded") +
        ggtitle("Reported Red-headed and White-rumped vulture nests and fledged individuals by Year")


# What this code accomplishes:
# First I recreated a data table from Clements et al. 2012,
# Vultures in Cambodia: population, threats and conservation. Using that table I created a boxplot
# that compares the number of Red-headed vulture (RHV) nests and fledged individuals with the number
# of White-rumped vulture (WRV) nests and fledged individuals.
#
# The next code reformats the data table to a long format so that I can create a side-by-side bar graph.
# This graph shows the year-to-year change in observed vulture nest and fledged individual spottings.
#
# Some key results are that RHV are much less common in the Cambodian study sites than WRV
# Also, WRV have seen a significant decline in nests since 2004-5 and
# RHV nests have gone up in the area since 2005-6 (although, still not many)
