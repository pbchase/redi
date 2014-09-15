makefakedata <- function(input, 
    min_panel=1, 
    max_panel=1, 
    incomplete_panels=FALSE,
    start_date="2112-01-01",
    end_date="2112-12-31",
    subject_count=1) {
    # input is a csv file with these columns:
    #   loinc_component - a name that describe a lab component
    #   loinc_code - the code for that lab component
    #   low - a normal low value for that component
    #   high - a normal high value for that component
    #   units - typical units for the component, compatible with low and high
    #   panel - a lab panel on which these tests are likely to appear
    #   loinc_long_common_name - a more descriptive name from LOINC

    # min_panel - the minimum number of panels to create for each subject

    # max_panel - the maximum number of panels to create for each subject

    # incomplete_panels - should we create panels with random missing values?

    # subject_count - the number of research subjects for which we should make data

    input_dataframe <- read.csv(input)
    minimal_input_dataframe <- input_dataframe[ c("loinc_component","loinc_code","low","high","units") ]

    for (i in (min_panel:max_panel)) {
        panel_df <- makeapanel(minimal_input_dataframe, start_date, end_date, incomplete_panels)
    }

    return (panel_df)
}
# result=runif(1, input_dataframe$low, input_dataframe$high),
makeapanel <- function (input_dataframe, 
    start_date="1900-01-01",
    end_date="1900-12-31",
    incomplete_panels=FALSE) {

    # add a result column with a random value within the accpetable range for each test
    output <- cbind(result=runif(nrow(input_dataframe), 
                        input_dataframe$low, 
                        input_dataframe$high), 
            input_dataframe)

    # add a date column.
    # Use a one row data frame trick rand.date into returning only one value
    x <- data.frame(dummy=1)
    output$date_time_stamp=rand.date(start_date, end_date, x)

    # TODO provide a minimum components per panel
    if (incomplete_panels == TRUE) {
        row_mask <- sample(0:8, nrow(input_df), replace=T) > 1
        output <- subset(output, row_mask)
    }

    return (output)

}

rand.date=function(start.day,end.day,data){
# This function will generate a uniform sample of dates from
# within a designated start and end date:
# Copyright StackOverflow user Colin, http://stackoverflow.com/users/2986028/colin

  size=dim(data)[1]
  days=seq.Date(as.Date(start.day),as.Date(end.day),by="day")
  pick.day=runif(size,1,length(days))
  date=days[pick.day]
}
