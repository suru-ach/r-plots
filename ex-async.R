#
# get csv data
#
data <- read.csv("WHO-COVID-19-global-data.csv")
data$Date_reported = as.Date(data$Date_reported)
data$New_cases = as.integer(data$New_cases)
data$New_deaths = as.integer(data$New_deaths)

# set up limits for dates
#dateStart <- as.Date("2022-01-01")
# dateStart <- min(data.country$Date_reported)

#dateEnd <- as.Date("2020-01-01")
# dateEnd <- max(data.country$Date_reported)

plot_cases <- function(startDate, endDate, country) {
    startDate = as.Date(startDate)
    endDate = as.Date(endDate)
    data.country <- subset(data, Country == country)
    main_cases = 
    main_deaths = 

    #plot with date and new case counts
    png(file = "./public/cases_plot.png", width = 2000, height = 800)
    plot(
      x=data.country$Date_reported,
      y=data.country$New_cases,
      cex = 0.5,las = 2,pch = 16,
      xlab = "date",
      ylab = "cases",
      xlim = c(startDate, endDate),
      ylim = c(0,max(data.country$New_cases)),
      main = paste(c("new_cases vs date, in ", country), sep = " ", collapse = "")
    )
    dev.off()

    png(file = "./public/death_plot.png", width = 2000, height = 800)
    plot(
      x=data.country$Date_reported,
      y=data.country$New_deaths,
      cex = 0.5,las = 2,pch = 2,
      xlab = "date",
      ylab = "deaths",
      xlim = c(startDate, endDate),
      ylim = c(0,max(data.country$New_deaths)),
      main = paste(c("new_deaths vs date, in ", country), sep = " ", collapse = "")
    )
    dev.off()
    print(c("./cases_plot.png", "./death_plot.png"))
}