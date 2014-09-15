makefakedata <- function(input, 
    min_panel=1, 
    max_panel=1, 
    incomplete_panels=false,
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

    result <- input_dataframe
}
# result=runif(1, input_dataframe$low, input_dataframe$high),
makeapanel <- function (input_dataframe, 
    incomplete_panels=FALSE) {

    output <- cbind(result=runif(nrow(input_dataframe), 
                        input_dataframe$low, 
                        input_dataframe$high), 
            input_dataframe)

    # TODO finish incomplete panels subsetting
    if (incomplete_panels) {
        row_mask <- sample(0:2, nrow(input_df), replace=T) > 1
        output <- subset(output, row_mask)
    }

    return (output)

}
