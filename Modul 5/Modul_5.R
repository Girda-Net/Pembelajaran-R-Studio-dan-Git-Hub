## load tidyverse
library("tidyverse")
## load ggpubr
#install.packages("ggpubr")
library("ggpubr")
## load GGally
#install.packages("GGally")
library("GGally")
## load esquisse
#install.packages("esquisse")
library("esquisse")

# Visualisasi Data

## Histogram dan Density Plot

## dari raw_data_1
raw_data_1 %>%
  ## visualisasikan histogram dari satisfaction_level
  gghistogram(x = "satisfaction_level")

## dari raw_data_1
raw_data_1 %>% 
  ## visualisasikan density plot dari satifaction_level
  ggdensity(x = "satisfaction_level")



## dari raw_data_1
raw_data_1 %>% 
  ## visualisasikan satisfaction_level
  ## dikelompokkan berdasarkan left
  gghistogram(x = "satisfaction_level", fill = "salary")

raw_data_1 %>% 
  ## visualisasikan histogram dari satisfaction_level
  gghistogram(x = "satisfaction_level",
              color = "White", title = "Satisfaction Level",
              fill = "3", ggtheme = theme_minimal())

## dari raw_data_1
raw_data_1 %>% 
  ## visualisasikan density plot dari satifaction_level
  ggdensity(x = "satisfaction_level", color = "Blue", size = 1, fill = "salary")

## boxplot dan violinplot

## dari raw_data_1
raw_data_1 %>% 
  ## visualisasikan boxplot dengan x = 'left' dan y = 'satisfaction_level'
  ggboxplot(x = "left", y = "satisfaction_level")

## dari raw_data_1
raw_data_1 %>% 
  ## visualisasikan boxplot dengan x = 'left' dan y = 'satisfaction_level'
  ggviolin(x = "left", y = "satisfaction_level")

## dari raw_data_1
raw_data_1 %>% 
  ## visualisasikan boxplot dengan x = 'left' dan y = 'satisfaction_level'
  ggviolin(x = "left", y = "satisfaction_level", add = "boxplot")

## barplot (Menghitung dalam grafik batang)

## dari raw_data_1
raw_data_1 %>%
  ## hitung jumlah data dari kelompok salary
  count(salary) %>% 
  ## buat barplot dengan x = "salary" dan y = "n"
  ggbarplot(x = "salary", 
            color = "Blue", title = "Salary",
            fill = "3", ggtheme = theme_minimal(),
            y = "n")

## dari raw_data_1
raw_data_1 %>%
  ## hitung jumlah data dari kelompok salary
  group_by(salary) %>% 
  ## hitung nilai mean average_monthly_hours dari tiap kelompok
  summarize(mean_amh = mean(average_montly_hours)) %>% 
  ## buat barplot dengan x = "salary" dan y = "n"
  ggbarplot(x = "salary", y = "mean_amh")

raw_data_1 %>%
  ## hitung jumlah data dari kelompok salary
  group_by(salary) %>% 
  ## hitung nilai mean average_monthly_hours dari tiap kelompok
  summarize(mean_amh = mean(average_montly_hours)) %>% 
  ## buat barplot dengan x = "salary" dan y = "n"
  ggbarplot(x = "salary", y = "mean_amh")


## pie chart dan donut chart

## dari raw_data_1
raw_data_1 %>% 
  ## hitung jumlah data dari kelompok salary
  count(salary) %>% 
  ## buat pie chart dengan nilai x = "n" dan label = "salary"
  ggpie(x = "n",label = "salary")

## dari raw_data_1
raw_data_1 %>% 
  ## hitung jumlah data dari kelompok salary
  count(salary) %>% 
  ## buat pie chart dengan nilai x = "n" dan label = "salary"
  ggpie(x = "n",
        color = "White", title = "Salary",
        fill = "3", ggtheme = theme_minimal(),
        label = "salary")


## dari raw_data_1
raw_data_1 %>% 
  ## hitung jumlah data dari kelompok salary
  count(salary) %>% 
  ## buat pie chart dengan nilai x = "n" dan label = "salary"
  ggdonutchart(x = "n", label = "salary")


## scatter plot

## dari raw_data_1
raw_data_1 %>% 
  ## buat scatter plot dengan x = "last_evaluation" dan y = "average_montly_hours"
  ggscatter(x = "last_evaluation", y = "average_montly_hours")

## dari raw_data_1
raw_data_1 %>% 
  ## buat scatter plot dengan x = "number_project" dan y = "time_spend_company"
  ggscatter(x = "number_project", y = "time_spend_company")

view(raw_data_1)

raw_data_1$left <- as.numeric(raw_data_1$left)

str(raw_data_1)

## correlation matrix

## dari raw_data_1
raw_data_1 %>% 
  ## hanya memilih variabel yang bertipe numerik
  select_if(is.numeric) %>% 
  ## pindahkan kolom 'left' ke posisi paling awal
  relocate(left) %>% 
  ## visualisasikan correlation matrix dengan metode pairwise spearman
  ## berikan label pada plot
  ggcorr(method = c("pairwise", "spearman"), label = T)





## scatter matrix

## dari raw_data_1
raw_data_1 %>% 
  ## hanya memilih variabel yang bertipe numerik
  select_if(is.numeric) %>% 
  ## pindahkan kolom 'left' ke posisi paling awal
  relocate(left) %>% 
  ## visualisasikan correlation matrix dengan metode pairwise spearman
  ## berikan label pada plot
  ggscatmat()


# Visualisasi Data menggunakan Esquisse

## gunakan esquisse untuk membuat visualisasi data dari
## raw_data_1
esquisser(raw_data_1)
