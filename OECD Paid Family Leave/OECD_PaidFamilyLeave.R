library(ggplot2)
library(RColorBrewer)
library(tidyr)
library(beanplot)
library(ggalt)


## Used data from OECD on paid family leave in OECD countries
OECD <- read.csv("OECD_PARENTALLEAVE_maternity_cleaned_1990&2016.csv", stringsAsFactors = FALSE, strip.white = TRUE)
OECD_2016 <- read.csv("OECD_PARENTALLEAVE_bothparents_cleaned_2016.csv", stringsAsFactors = FALSE, strip.white = TRUE)


##Dumbbell chart - comparing change from 1990 to 2016 in availability of paid family leave
#Note - Adobe Illustrator was used to create final result

oecd_short <- spread(OECD, TIME, Value)

ggplot(oecd_short, aes(y = reorder(oecd_short$Country, oecd_short$`2016`), x = oecd_short$`1990`, xend = oecd_short$`2016`)) +
  geom_dumbbell(size=2, size_x = 5, size_xend = 5, color="#bdbdbd", 
                colour_x = "#85c9c9", colour_xend = "#2f6d6d",
                dot_guide=TRUE, dot_guide_size=.2) +
  theme(panel.background = element_blank(), axis.ticks = element_blank(),  axis.text = element_text(size=10)) +
  labs(
    title = "Change in Maternity Leave in OECD Countries between 1990 and 2016",
    x = "Weeks of Maternity Leave",
    y = " ",
    caption = "Source: OECD Stat")


#Split beanplot - comparing maternity leave and paternity leave availibility in OECD countries in 2016
jitteredm <- jitter(OECD$Length.of.maternity.leave)
jitteredp <- jitter(OECD$Length.of.paid.father.specific.leave)
beanplot(jitteredm, jitteredp, side = "both", col = list("#85c9c9", c("#2f6d6d", "black")),
         xlab = "Paid Family Leave", main = "Paid Family Leave in OECD Countries (2016)")
legend("topright", fill = c("#85c9c9", "#2f6d6d"),
       legend = c("Maternity Leave", "Paternity Leave"), box.lty=0)




