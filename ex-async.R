# get csv data
#
data <- read.csv("WHO-COVID-19-global-data.csv")
data$Date_reported = as.Date(data$Date_reported)
data$New_cases = as.integer(data$New_cases)
data$New_deaths = as.integer(data$New_deaths)

# set up limits for dates
#dateStart <- as.Date("2022-01-01")
# dateStart <- min(data_country$Date_reported)

#dateEnd <- as.Date("2020-01-01")
# dateEnd <- max(data_country$Date_reported)

plot_cases <- function(startDate, endDate, country) {

    sDate = as.Date(startDate)
    eDate = as.Date(endDate)
    data_country <- subset(data, Country == country & (Date_reported > sDate & Date_reported < eDate))
    # print(data_country)

    #plot with date and new case counts
    png(file = "./public/cases_plot.png", width = 2000, height = 800)
    plot(
      x=data_country$Date_reported,
      y=data_country$New_cases,
      cex = 0.5,las = 2,pch = 2,
      xlab = "date",
      ylab = "cases",
      xlim = c(sDate, eDate),
      col = "red",
      type = "h",
      ylim = c(0,max(data_country$New_cases)),
      main = paste(c("new_cases vs date, in ", country), sep = " ", collapse = "")
    )
    dev.off()

    png(file = "./public/death_plot.png", width = 2000, height = 800)
    plot(
      x=data_country$Date_reported,
      y=data_country$New_deaths,
      cex = 0.5,las = 2,pch = 2,
      xlab = "date",
      ylab = "deaths",
      col = "red",
      type = "h",
      xlim = c(sDate, eDate),
      ylim = c(0,max(data_country$New_deaths)),
      main = paste(c("new_deaths vs date, in ", country), sep = " ", collapse = "")
    )
    dev.off()
}
# plot_cases("2020-01-03", "2023-01-06", "India")