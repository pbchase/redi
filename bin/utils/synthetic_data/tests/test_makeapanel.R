
# test makeapanel with a one-component panel 
input_df = data.frame("Leukocytes","26464-8",3.8,10.8,"10*3/uL")
colnames(input_df) = c("loinc_component","loinc_code","low","high","units")

output_df <- makeapanel(input_df)

expect_equal(ncol(output_df) - ncol(input_df), 1)
expect_equal(nrow(output_df), nrow(input_df))


# test makeapanel with a two-component panel 
input_df = data.frame("Leukocytes","26464-8",3.8,10.8,"10*3/uL")
colnames(input_df) = c("loinc_component","loinc_code","low","high","units")
test_df <- rbind(input_df, data.frame(loinc_component="Neutrophils", 
                loinc_code="26499-4",
                low=1.5,
                high=7.8,
                units="10*3/uL"))

output_df <- makeapanel(input_df)

expect_equal(ncol(output_df) - ncol(input_df), 1)
expect_equal(nrow(output_df), nrow(input_df))
