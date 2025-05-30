library(tidyverse)
library(fetchagol)
library(NPSdataverse)
library(imdccal)
pak::pak("nationalparkservice/mojn-stlk-rpackage@master")
library(streamsandlakes)

stlkdata <- streamsandlakes:::LoadStreamsAndLakes()

# Set output folder for CSV exports
dest.folder <- paste0(here::here(),"/",format(Sys.time(), format="%Y-%m-%dT%H%M%S"))

# Folder export/sls must already exist. Code below will only make the date-time subfolder
if (file.exists(dest.folder)) {
  cat("The folder already exists")
} else {
  dir.create(dest.folder)
}

# Export calculated results to CSV files
LakeLevel_CALCULATED <- streamsandlakes:::LakeSurfaceElevation()
LakeWaterQuality_CALCULATED <- streamsandlakes:::LakeWqMedian()
StreamWaterQuality_CALCULATED <- streamsandlakes:::StreamWqMedian()

# Export results to CSV files
readr::write_csv(stlkdata$Site, file.path(dest.folder, paste0("Site", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$Visit, file.path(dest.folder, paste0("Visit", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$LakeLevelString, file.path(dest.folder, paste0("LakeLevelString", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$LakeLevelSurvey, file.path(dest.folder, paste0("LakeLevelSurvey", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$WaterQualityTemperature, file.path(dest.folder, paste0("WaterQualityTemperature", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$WaterQualitypH, file.path(dest.folder, paste0("WaterQualitypH", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$WaterQualitySpCond, file.path(dest.folder, paste0("WaterQualitySpCond", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$WaterQualityDO, file.path(dest.folder, paste0("WaterQualityDO", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$WQStreamXSection, file.path(dest.folder, paste0("WQStreamXSection", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$Clarity, file.path(dest.folder, paste0("Clarity", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$Channel, file.path(dest.folder, paste0("Channel", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$Chemistry, file.path(dest.folder, paste0("Chemistry", ".csv")), na = "", append = FALSE, col_names = TRUE)

readr::write_csv(LakeLevel_CALCULATED, file.path(dest.folder, paste0("LakeLevel_CALCULATED", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(LakeWaterQuality_CALCULATED, file.path(dest.folder, paste0("LakeWaterQuality_CALCULATED", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(StreamWaterQuality_CALCULATED, file.path(dest.folder, paste0("StreamWaterQuality_CALCULATED", ".csv")), na = "", append = FALSE, col_names = TRUE)

# Tables not published in data package
readr::write_csv(stlkdata$BMIVisit, file.path(dest.folder, paste0("BMIVisit", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$BMIMetrics, file.path(dest.folder, paste0("BMIMetrics", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$BMISpecies, file.path(dest.folder, paste0("BMISpecies", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$CalibrationpH, file.path(dest.folder, paste0("CalibrationpH", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$CalibrationSpCond, file.path(dest.folder, paste0("CalibrationSpCond", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$CalibrationDO, file.path(dest.folder, paste0("CalibrationDO", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$TimeseriesWaterLevel, file.path(dest.folder, paste0("TimeseriesWaterLevel", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$TimeseriesDischarge, file.path(dest.folder, paste0("TimeseriesDischarge", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$TimeseriesTemperature, file.path(dest.folder, paste0("TimeseriesTemperature", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$TimeseriespH, file.path(dest.folder, paste0("TimeseriespH", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$TimeseriesSpCond, file.path(dest.folder, paste0("TimeseriesSpCond", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$TimeseriesDOmgl, file.path(dest.folder, paste0("TimeseriesDOmgl", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$TimeseriesDOpct, file.path(dest.folder, paste0("TimeseriesDOpct", ".csv")), na = "", append = FALSE, col_names = TRUE)
readr::write_csv(stlkdata$BMI, file.path(dest.folder, paste0("BMI", ".csv")), na = "", append = FALSE, col_names = TRUE)


