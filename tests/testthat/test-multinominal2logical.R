context("multinominal2logical")


## sample data requires soilDB >= 2.5
if(!requireNamespace('soilDB') | packageVersion("soilDB") < '2.5') {
  skip(message = 'test requires soilDB >= 2.5')
}



## tests
test_that("multinominal2logical works as expected", {
  
  data(loafercreek, package='soilDB')
  
  loafercreek$hillslopeprof <- factor(loafercreek$hillslopeprof, 
                                      levels = c('summit', 'shoulder', 
                                                 'backslope', 'footslope', 'toeslope'))
  # convert to logical matrix
  hp <- multinominal2logical(loafercreek, 'hillslopeprof')
  
  # basic structure of a result
  expect_equal(names(hp), c('peiid', 'summit', 'shoulder', 'backslope', 'footslope', 'toeslope'))
  expect_true(inherits(hp, 'data.frame'))
  
  # length is preserved, ordering is not
  expect_true(nrow(hp) == length(loafercreek))
  
  # test a single case
  # note that this will break if loafercreek is re-generated
  # "backslope"
  ex.hp <- hp[which(hp$peiid == 207255), ]
  ex.pedon <- loafercreek[which(profile_id(loafercreek) == 207255), ]
  
  expect_true(ex.hp[[as.character(ex.pedon$hillslopeprof)]])
  
})




