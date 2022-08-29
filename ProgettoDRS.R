
# install.packages("dplyr")
library(dplyr)

#install.packages("stringr")
library(stringr)

#install.packages('tidyverse')
library(tidyverse)

#install.packages('ggplot2')
library(ggplot2)

#install.packages('gridExtra')
library(gridExtra)

#install.packages('ggthemes')
library(ggthemes)

# install.packages('patchwork')
library(patchwork) 

# install.packages('grid')
library(grid)

#install.packages('ggrepel')
library(ggrepel)

# install.packages('forcats')
library(forcats)

#install.packages('RColorBrewer')
library(RColorBrewer)

# install.packages('viridis')
library(viridis)

# install.packages('circlize')
# library(circlize)

###CSV import
Overtake2022 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2022 Overtake - Sheet1.csv')
Overtake2021 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2021 Overtakes - Sheet1.csv')
Overtake2020 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2020 Overtakes - Sheet1.csv')
Overtake2019 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2019 Overtakes - Sheet1.csv')
Overtake2018 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2018 Overtakes - Sheet1.csv')
Overtake2017 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2017 Overtakes - Sheet1.csv')
Overtake2016 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2016 Overtakes - Sheet1.csv')
Overtake2015 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2015 Overtakes  - Sheet1.csv')
Overtake2014 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2014 Overtakes - Sheet1.csv')
Overtake2013 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2013 Overtakes - Sheet1.csv')
Overtake2012 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2012 Overtakes - Sheet1.csv')
Overtake2011 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2011 Overtakes - Sheet1.csv')
Overtake2010 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2010 Overtakes - Sheet1.csv')
Overtake2009 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2009 Overtakes - Sheet1.csv')
Overtake2008 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2008 Overtakes - Sheet1.csv')
Overtake2007 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2007 Overtakes - Sheet1.csv')
Overtake2006 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2006 Overtakes - Sheet1.csv')
Overtake2005 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2005 Overtakes - Sheet1.csv')
Overtake2004 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2004 Overtakes - Sheet1.csv')
Overtake2003 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2003 Overtakes - Sheet1.csv')
Overtake2002 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2002 Overtakes - Sheet1.csv')
Overtake2001 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2001 Overtakes - Sheet1.csv')
Overtake2000 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/2000 Overtakes - Sheet1.csv')
Overtake1999 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/1999 Overtakes - Sheet1.csv')
Overtake1998 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/1998 Overtakes - Sheet1.csv')
Overtake1997 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/1997 Overtakes - Sheet1.csv')
Overtake1996 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/1996 Overtakes - Sheet1.csv')
Overtake1995 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/1995 Overtakes - Sheet1.csv')
Overtake1994 = read.csv('/Users/gianlucafava/Desktop/Progetto_DRS/csv/1994 Overtakes - Sheet1.csv')


#DATA CONTROL:
#all data are counted from the second race lap
##first test from:  https://www.formula1.com/en/latest/article.crypto-com-overtake-award-2021.6zySqi1DQO2UzeveSeRlf4.html

Overtake2021 %>% filter(Overtaker == "Vettel")     ## 56 -> 132
Overtake2021 %>% filter(Overtaker == "Alonso")     ## 42 -> 128
Overtake2021 %>% filter(Overtaker == "Raikkonen")     ## 40 -> 132
##these turn out to be a bit different from the official data, but this is plausible since in this case overtaking is counted from the first corner

##second test from:  https://www.autosport.com/f1/news/overtaking-records-in-f1/6438038/?nrt=54

Overtake2016 %>% filter(Race == "China")    ## 125 -> 161
Overtake2012 %>% filter(Race == "Brazil")    ## 125 -> 147
Overtake2003 %>% filter(Race == "Monaco")    ## 0 -> 0
Overtake2005 %>% filter(Race == "USA")    ## 0 -> 0
Overtake2021 %>% filter(Race == "Monaco")    ## 0 -> 0
##In this case the data is much more correct



###I make a single dataset to have less messing up, first I have to put a date for each dataset since there isn't
Overtake2022$date = "2022"
Overtake2022 = rename(Overtake2022, Live. = Live)
Overtake2022 = rename(Overtake2022, Overtakee = Overtaken)

Overtake2021$date = "2021"
Overtake2021 = rename(Overtake2021, Live. = Live)
Overtake2021 = rename(Overtake2021, Overtakee = Overtaken)

Overtake2020$date = "2020"
Overtake2020 = rename(Overtake2020, Live. = Live)
Overtake2020[Overtake2020 == "70th Anniversary"] <- "Great Britain"
Monaco2020 = data_frame(
  Race = "Monaco",
  Lap = NA,
  Position = NA,
  Overtaker = NA,
  Overtakee = NA,
  Live. = NA,
  Turn = NA,
  date = "2020"
)
Overtake2020 = full_join(Overtake2020, Monaco2020)

Overtake2019$date = "2019"
Overtake2019 = rename(Overtake2019, Live. = Live)

Overtake2018$date = "2018"
Overtake2018 = rename(Overtake2018, Live. = Live)

Overtake2017$date = "2017"
Overtake2017 = rename(Overtake2017, Live. = Live)

Overtake2016$date = "2016"

Overtake2015$date = "2015"
Overtake2015 = rename(Overtake2015, Live. = Live)

Overtake2014$date = "2014"
Overtake2013$date = "2013"
Overtake2012$date = "2012"

Overtake2011$date = "2011"
Overtake2011 = rename(Overtake2011, Live. = Live)

Overtake2010$date = "2010"

Overtake2009$date = "2009"
Overtake2009 = rename(Overtake2009, Live. = Live)

Overtake2008$date = "2008"

Overtake2007$date = "2007"
Overtake2007 = rename(Overtake2007, Live. = Live)

Overtake2006$date = "2006"
Overtake2005$date = "2005"
Overtake2004$date = "2004"
Overtake2003$date = "2003"
Overtake2002$date = "2002"

Overtake2001$date = "2001"
Overtake2001 = rename(Overtake2001, Live. = Live)

Overtake2000$date = "2000"
Overtake1999$date = "1999"

Overtake1998$date = "1998"
Overtake1998 = rename(Overtake1998, Live. = Live)

Overtake1997$date = "1997"
Overtake1997 = rename(Overtake1997, Live. = Live)

Overtake1996$date = "1996"
Overtake1996 = rename(Overtake1996, Live. = Live)

Overtake1995$date = "1995"
Overtake1995 = rename(Overtake1995, Live. = Live)

Overtake1994$date = "1994"
Overtake1994 = rename(Overtake1994, Live. = Live)


AllData = full_join(Overtake2022, Overtake2021)
AllData = full_join(AllData, Overtake2020)
AllData = full_join(AllData, Overtake2019)
AllData = full_join(AllData, Overtake2018)
AllData = full_join(AllData, Overtake2017)
AllData = full_join(AllData, Overtake2016)
AllData = full_join(AllData, Overtake2015)
AllData = full_join(AllData, Overtake2014)
AllData = full_join(AllData, Overtake2013)
AllData = full_join(AllData, Overtake2012)
AllData = full_join(AllData, Overtake2011)
AllData = full_join(AllData, Overtake2010)
AllData = full_join(AllData, Overtake2009)
AllData = full_join(AllData, Overtake2008)
AllData = full_join(AllData, Overtake2007)
AllData = full_join(AllData, Overtake2006)
AllData = full_join(AllData, Overtake2005)
AllData = full_join(AllData, Overtake2004)
AllData = full_join(AllData, Overtake2003)
AllData = full_join(AllData, Overtake2002)
AllData = full_join(AllData, Overtake2001)
AllData = full_join(AllData, Overtake2000)
AllData = full_join(AllData, Overtake1999)
AllData = full_join(AllData, Overtake1998)
AllData = full_join(AllData, Overtake1997)
AllData = full_join(AllData, Overtake1996)
AllData = full_join(AllData, Overtake1995)
AllData = full_join(AllData, Overtake1994)


##all the overtake from 1999 since today
###I want to select only races with more than 5 races and select only races and not sprint races

AllData[AllData == "Emilia-Romagna S"] <- "Emilia Romagna Sprint"
AllData[AllData == "Emilia-Romagna"] <- "Emilia Romagna"
AllData[AllData == "GB Sprint"] <- "Great Britain Sprint"
AllData[AllData == "San Marino"] <- "Emilia Romagna"
AllData[AllData == "Britain"] <- "Great Britain"

# Circuit = AllData %>% select(Race)
# Circuit = unique(Circuit)

Print1 = AllData %>% 
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>% 
  summarize(SumOvertake = NROW(Overtakee)) %>%
  filter(n() > 3) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) + 
  geom_point(size= 0.6) +
  scale_x_discrete(breaks = c("1994","1996","1998","2000","2002","2004","2006","2008","2010","2012","2014","2016","2018","2020","2022"),
                   limits = as.character(1994:2022)) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(
    axis.text.x = element_text(size=5.5,angle=90),
    strip.text.x = element_text(size = 9),
    legend.position="none") +
  facet_wrap(~Race,ncol=7) +
  labs(title='Numero di sorpassi dal 1994 al 2022',
       subtitle = 'Non sono inclusi i circuiti con meno di 3 gare e le sprint race') 


#the DRS was included in 2011, how many overtakes were there in the 10 years before and in the 10 years after?

Print2 = AllData %>%
  subset(date>= "2001" & date <= "2021") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) +
  geom_boxplot(alpha=.25) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  geom_jitter(shape=16,position=position_jitter(0.2),size=1) +
  geom_smooth( method='lm',aes(group=1),color='#31B037',lty=2,size=1, fill="#B6FEB9") +
  geom_smooth(method='loess',aes(group=1),color='#FA2525',lty=1,size=1, se=FALSE) +
  geom_vline(xintercept = 11, lty=1, color = "#808080", size=0.4) +
  annotate(geom="text", x= "2012", y=170, label="               Aggiunta DRS") +
  annotate(geom="point", x="2011", y=170, size=5, shape=21, fill="gray") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(legend.position="none") +
  labs(title='Numero dei sorpassi prima e dopo l`aggiunta del DRS (20 anni)')

GeneralMeanB =  AllData %>%
  subset(date>= "2001" & date <= "2010") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))  %>%
  filter(n() > 3)
mean(GeneralMeanB$SumOvertake)

GeneralMeanA = AllData %>%
  subset(date>= "2011" & date <= "2021") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))  %>%
  filter(n() > 3)
mean(GeneralMeanA$SumOvertake)


#zooming to 5 years before and 5 years after

Print3 = AllData %>%
  subset(date>= "2006" & date <= "2015") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) +
  geom_boxplot(alpha=.25) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  geom_jitter(shape=16,position=position_jitter(0.2),size=1.5) +
  geom_smooth( method='lm',aes(group=1),color='#31B037',lty=2,size=1, fill="#B6FEB9") +
  geom_smooth(method='loess',aes(group=1),color='#FA2525',lty=1,size=1, se=FALSE) +
  geom_vline(xintercept = 6, lty=1, color = "#808080", size=0.4) +
  annotate(geom="text", x= "2012", y=170, label="   Aggiunta DRS") +
  annotate(geom="point", x="2011", y=170, size=5, shape=21, fill="gray") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(legend.position="none") +
  labs(title='Numero dei sorpassi prima e dopo l`aggiunta del DRS (10 anni)')

GeneralMeanB5 = AllData %>%
  subset(date>= "2006" & date <= "2010") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  filter(n() > 3)
mean(GeneralMeanB5$SumOvertake)

GeneralMeanA5 = AllData %>%
  subset(date>= "2011" & date <= "2015") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))  %>%
  filter(n() > 3)
mean(GeneralMeanA5$SumOvertake)


#which is the track where there have been the most overtaking?

MostOvertake = AllData %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  filter(n() > 3)

AveregeOvertake = data_frame(aggregate(MostOvertake$SumOvertake, by=list(Race=MostOvertake$Race), mean)) %>%
  arrange(x)
AveregeOvertake = rename(AveregeOvertake, SumOvertake = x)

Print4 = AveregeOvertake %>%
  arrange(SumOvertake) %>%
  mutate(class = fct_reorder(Race, SumOvertake, .fun='mean')) %>%
  ggplot( aes(x=reorder(class, SumOvertake), y=SumOvertake, fill=class)) +
  geom_bar(aes(fill=SumOvertake), stat='identity', color='white',size=.2) +
  coord_flip() +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(axis.text.x = element_text(size=9,angle=0),
        legend.position="none") +
  labs(title='Media dei sorpassi stagionali per circuito',
       subtitle = 'Non sono inclusi i circuiti con meno di 3 gare')



##full plot circuit with less overtake
Print12 = AllData %>%
  subset(date>= "2006" & date <= "2015") %>%
  filter(Race == "Hungary" | Race == "Monaco") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) +
  geom_point() +
  geom_smooth( method='lm',aes(group=1),color='#31B037',lty=2,size=0.7, fill="#B6FEB9") +
  geom_smooth(method='loess',aes(group=1),color='#FA2525',lty=1,size=0.7, se = FALSE) +
  geom_vline(xintercept = 6, lty=1, color = "#717271", size=0.4) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(
    axis.text.x = element_text(size=7,angle=90),
    strip.text.x = element_text(size = 12),
    legend.position="none",
    panel.spacing = unit(3, "lines")) +
  facet_wrap(~Race,ncol=1) +
  labs(title='Numero di sorpassi: 10 anni',
       subtitle = 'Dal 2006 al 2015') +
  AllData %>%
  subset(date>= "2001" & date <= "2021") %>%
  filter(Race == "Hungary" | Race == "Monaco") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) +
  geom_point() +
  geom_smooth( method='lm',aes(group=1),color='#31B037',lty=2,size=0.7, fill="#B6FEB9") +
  geom_smooth(method='loess',aes(group=1),color='#FA2525',lty=1,size=0.7, se = FALSE) +
  geom_vline(xintercept = 11, lty=1, color = "#717271", size=0.4) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(
    axis.text.x = element_text(size=7,angle=90),
    strip.text.x = element_text(size = 12),
    legend.position="none",
    panel.spacing = unit(3, "lines")) +
  facet_wrap(~Race,ncol=1) +
  labs(title='Numero di sorpassi: 20 anni',
       subtitle = 'Dal 2004 al 2021')

MonacoMean1 = AllData %>%
  subset(date>= "2006" & date <= "2010") %>%
  filter(Race == "Monaco") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(MonacoMean1$SumOvertake)

MonacoMean2 = AllData %>%
  subset(date>= "2011" & date <= "2015") %>%
  filter(Race == "Monaco") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(MonacoMean2$SumOvertake)

MonacoMean3 = AllData %>%
  subset(date>= "2001" & date <= "2010") %>%
  filter(Race == "Monaco") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(MonacoMean3$SumOvertake)

MonacoMean4 = AllData %>%
  subset(date>= "2011" & date <= "2021") %>%
  filter(Race == "Monaco") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(MonacoMean4$SumOvertake)


HungaryMean1 = AllData %>%
  subset(date>= "2006" & date <= "2010") %>%
  filter(Race == "Hungary") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(HungaryMean1$SumOvertake)

HungaryMean2 = AllData %>%
  subset(date>= "2011" & date <= "2015") %>%
  filter(Race == "Hungary") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(HungaryMean2$SumOvertake)

HungaryMean3 = AllData %>%
  subset(date>= "2001" & date <= "2010") %>%
  filter(Race == "Hungary") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(HungaryMean3$SumOvertake)

HungaryMean4 = AllData %>%
  subset(date>= "2011" & date <= "2021") %>%
  filter(Race == "Hungary") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(HungaryMean4$SumOvertake)



#full plot circuit with more overtake
Print13 = AllData %>%
  subset(date>= "2006" & date <= "2015") %>%
  filter(Race == "China" | Race == "Bahrain") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) +
  geom_point() +
  geom_smooth( method='lm',aes(group=1),color='#31B037',lty=2,size=0.7, fill="#B6FEB9") +
  geom_smooth(method='loess',aes(group=1),color='#FA2525',lty=1,size=0.7, se = FALSE) +
  geom_vline(xintercept = 6, lty=1, color = "#717271", size=0.4) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(
    axis.text.x = element_text(size=7,angle=90),
    strip.text.x = element_text(size = 12),
    legend.position="none",
    panel.spacing = unit(3, "lines")) +
  facet_wrap(~Race,ncol=1) +
  labs(title='Numero di sorpassi: 10 anni',
       subtitle = 'Dal 2006 al 2015') +
  AllData %>%
  subset(date>= "2001" & date <= "2017") %>%
  filter(Race == "China" | Race == "Bahrain") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) +
  geom_point() +
  geom_smooth( method='lm',aes(group=1),color='#31B037',lty=2,size=0.7, fill="#B6FEB9") +
  geom_smooth(method='loess',aes(group=1),color='#FA2525',lty=1,size=0.7, se = FALSE) +
  geom_vline(xintercept = 8, lty=1, color = "#717271", size=0.4) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(
    axis.text.x = element_text(size=7,angle=90),
    strip.text.x = element_text(size = 12),
    legend.position="none",
    panel.spacing = unit(3, "lines")) +
  facet_wrap(~Race,ncol=1) +
  labs(title='Numero di sorpassi: 14 anni',
       subtitle = 'Dal 2004 al 2017')

ChinaMean1 = AllData %>%
  subset(date>= "2006" & date <= "2010") %>%
  filter(Race == "China") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(ChinaMean1$SumOvertake)

ChinaMean2 = AllData %>%
  subset(date>= "2011" & date <= "2015") %>%
  filter(Race == "China") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(ChinaMean2$SumOvertake)

ChinaMean3 = AllData %>%
  subset(date>= "2004" & date <= "2010") %>%
  filter(Race == "China") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(ChinaMean3$SumOvertake)

ChinaMean4 = AllData %>%
  subset(date>= "2011" & date <= "2017") %>%
  filter(Race == "China") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(ChinaMean4$SumOvertake)


Bahrain1 = AllData %>%
  subset(date>= "2006" & date <= "2010") %>%
  filter(Race == "Bahrain") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(Bahrain1$SumOvertake)

Bahrain2 = AllData %>%
  subset(date>= "2011" & date <= "2015") %>%
  filter(Race == "Bahrain") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(Bahrain2$SumOvertake)

Bahrain3 = AllData %>%
  subset(date>= "2004" & date <= "2010") %>%
  filter(Race == "Bahrain") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(Bahrain3$SumOvertake)

Bahrain4 = AllData %>%
  subset(date>= "2011" & date <= "2017") %>%
  filter(Race == "Bahrain") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee))
mean(Bahrain4$SumOvertake)




#2010,2011,2022
Print11 = AllData %>%
  subset(date == "2010" | date == "2011" | date == "2022") %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  filter(n() > 3) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) +
  geom_boxplot(alpha=.25) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  geom_jitter(shape=16,position=position_jitter(0.2),size=1.5) +
  geom_vline(xintercept = 1, lty=1, color = "#808080", size=0.4) +
  annotate(geom="text", x= "2010", y=142, label="                               Prima del DRS") +
  geom_vline(xintercept = 2, lty=1, color = "#808080", size=0.4) +
  annotate(geom="text", x= "2011", y=142, label="                              Aggiunta DRS") +
  geom_vline(xintercept = 3, lty=1, color = "#808080", size=0.4) +
  annotate(geom="text", x= "2022", y=142, label="             Oggi") +
  annotate(geom="point", x="2010", y=142, size=5, shape=21, fill="gray") +
  annotate(geom="point", x="2011", y=142, size=5, shape=21, fill="gray") +
  annotate(geom="point", x="2022", y=142, size=5, shape=21, fill="gray") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(legend.position="none") +
  labs(title='Numero di sorpassi: 2010 vs 2011 vs 2022',
       subtitle = 'Non sono inclusi i circuiti cone meno di 3 gare')




#Season with more overtake
SeasonOvertake = AllData %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  filter(n() > 3)

AveregeSeasonOvertake = data_frame(aggregate(SeasonOvertake$SumOvertake, by=list(date=SeasonOvertake$date), mean)) %>%
  arrange(x)
AveregeSeasonOvertake = rename(AveregeSeasonOvertake, SumOvertake = x)

Print15 = AveregeSeasonOvertake %>%
  arrange(SumOvertake) %>%
  mutate(class = fct_reorder(date, SumOvertake, .fun='mean')) %>%
  ggplot( aes(x=reorder(class, SumOvertake), y=SumOvertake, fill=class)) +
  geom_bar(aes(fill=SumOvertake), stat='identity', color='white',size=.2) +
  coord_flip() +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(axis.text.x = element_text(size=9,angle=0),
        legend.position="none") +
  labs(title='Media di sorpassi per ogni stagione')


# TotalSeasonOvertake = data_frame(aggregate(SeasonOvertake$SumOvertake, by=list(date=SeasonOvertake$date), sum)) %>%
#   arrange(x)
# TotalSeasonOvertake = rename(TotalSeasonOvertake, SumOvertake = x)

AveregeSeasonOvertake %>% filter(date == "2011")
AveregeSeasonOvertake %>% filter(date == "2012")
AveregeSeasonOvertake %>% filter(date == "2013")





#pilots with more overtaking
Print16 = AllData %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Overtaker, Race) %>%
  summarize(count = n()) %>%
  mutate(AllOvertake = sum(count)) %>%
  filter(AllOvertake > 100)  %>%
  ggplot(aes(x=reorder(Overtaker, AllOvertake), y= count)) +
  geom_bar(aes(fill=Race), stat='identity', color='white',size=.2) +
  coord_flip() +
  theme_fivethirtyeight(base_size = 8, base_family = "sans") +
  scale_fill_manual(name="",
                    values = viridis(65)) +
  theme(axis.text.y = element_text(size=6,angle=0),
        legend.text= element_text(size=7),
        legend.key.size = unit(.15, "cm"),
        legend.position=c(.65,.25)) +
  labs(title="Numero totale di sorpassi eseguiti, per pilota",
       subtitle="Solo i piloti con più di 100 sorpassi eseguiti sono inclusi")


#drivers overtaken several times
Print17 = AllData %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Overtakee, Race) %>%
  summarize(count = n()) %>%
  mutate(AllOvertake = sum(count)) %>%
  filter(AllOvertake > 100)  %>%
  ggplot(aes(x=reorder(Overtakee, AllOvertake), y= count)) +
  geom_bar(aes(fill=Race), stat='identity', color='white',size=.2) +
  coord_flip() +
  theme_fivethirtyeight(base_size = 8, base_family = "sans") +
  scale_fill_manual(name="",
                    values = viridis(65)) +
  theme(axis.text.y = element_text(size=5.5,angle=0),
        legend.text= element_text(size=7),
        legend.key.size = unit(.15, "cm"),
        legend.position=c(.70,.25)) +
  labs(title="Numero totale di sorpassi subiti, per pilota",
       subtitle="Solo i piloti con più di 100 sorpassi subiti sono inclusi")


##perc
Overtakee = AllData %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Overtakee, Race) %>%
  summarize(count = n()) %>%
  mutate(AllOvertake = sum(count)) %>%
  group_by(Overtakee, AllOvertake) %>%
  summarize(count = n())
Overtakee$count = NULL
Overtakee = rename(Overtakee, OvertakingSuffered = AllOvertake)
Overtakee = rename(Overtakee, Name = Overtakee)

Overtaker = AllData %>%
  filter(!Race %in% c("Emilia Romagna Sprint", "Austria Sprint", "Great Britain Sprint", "Italy Sprint", "Brazil Sprint")) %>%
  group_by(Overtaker, Race) %>%
  summarize(count = n()) %>%
  mutate(AllOvertake = sum(count)) %>%
  group_by(Overtaker, AllOvertake) %>%
  summarize(count = n())
Overtaker$count = NULL
Overtaker = rename(Overtaker, OvertakingPerformed = AllOvertake)
Overtaker = rename(Overtaker, Name = Overtaker)

Overtaking = full_join(Overtaker, Overtakee)

bestDefender = Overtaking %>%
  group_by(Name) %>%
  mutate(perc = OvertakingSuffered * 100 / OvertakingPerformed) %>%
  as.data.frame()

Print18 = bestDefender %>%
  filter(OvertakingPerformed > 100) %>%
  filter(perc < 150) %>%
  arrange(- perc) %>%
  group_by(Name, perc) %>%
  ggplot(aes(x=reorder(Name, perc), y=perc, fill= perc)) +
  geom_bar(aes(fill=perc), stat='identity', color='white',size=.2) +
  coord_flip() +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "#BBF1FC",
    guide = "colourbar",
    aesthetics = "colour")  +
  theme(axis.text.y = element_text(size=6.7,angle=0),
        axis.text.x = element_text(size=8,angle=0),
        legend.position="none" ) +
  labs(title="Percentuale di sorpassi effettuati rispetto ai subiti",
       subtitle = "Solo i piloti che hanno effettuato più di 100 sorpassi sono inclusi
(Minore è la percentuale e più forte è il pilota)")



#Hungary 2021 vs 2022 why so many overtaking?
Print22 = AllData %>%
  subset(date == "2021" | date == "2022") %>%
  filter(Race == "Hungary") %>%
  group_by(Race, date) %>%
  summarize(SumOvertake = NROW(Overtakee)) %>%
  ggplot(aes(x=date, y= SumOvertake, color = SumOvertake)) +
  geom_bar(aes(fill=SumOvertake), stat='identity', color='white',size=.2) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  annotate(geom="text", x= "2021", y=8.5, label="17", size=8, color="white") +
  annotate(geom="text", x= "2022", y=32.5, label="65", size=8, color="white") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(legend.position="none") +
  labs(title='Numero di sorpassi nel GP d`Ungheria: 2021 vs 2022')


##let's analyze in which turn the overtaking was mostly done

Print23 = AllData %>%
  subset(date == "2021" ) %>%
  filter(Race == "Hungary") %>%
  group_by(Race, Turn) %>%
  summarize(count = n()) %>%
  arrange(count) %>%
  ggplot(aes(x=reorder(Turn, count), y=count, fill=class) ) +
  geom_bar(aes(fill=count), stat='identity', color='white',size=.2) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(legend.position="none") +
  labs(title='Sorpassi per curva: 2021') +
  AllData %>%
  subset(date == "2022" ) %>%
  filter(Race == "Hungary") %>%
  group_by(Race, Turn) %>%
  summarize(count = n()) %>%
  arrange(count) %>%
  ggplot(aes(x=reorder(Turn, count), y=count, fill=class) ) +
  geom_bar(aes(fill=count), stat='identity', color='white',size=.2) +
  theme_fivethirtyeight(base_size = 11, base_family = "sans") +
  scale_colour_gradient(
    name="",
    low = "#0C36A7",
    high = "#14CBF8",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  theme(legend.position="none") +
  labs(title='Sorpassi per curva: 2022')













