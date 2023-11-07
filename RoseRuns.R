simRoll <- function(wantedRoseCount = 9, dropChance = 0.04, killsRun = 6) {
  i <- 0
  roseCount <- 0
  while (roseCount < wantedRoseCount) {
    roseCount <- roseCount + sample(c(0,1), 1, T, c(1-dropChance, dropChance))
    i <- i + 1
  }
  return(ceiling(i/killsRun))
}

dropRuns <- function(runs = 10000, wantedRoseCount = 45, dropChance = 0.04, killsRun = 6) {
  roseRuns <- c(1:runs)
  for (i in 1:runs) {
    roseRuns[i] <- simRoll(wantedRoseCount, dropChance, killsRun)
  }
  print(summary(roseRuns))
  hist(roseRuns, breaks = 40)
}
dropRuns(10000, 6, 0.12928, 10)
