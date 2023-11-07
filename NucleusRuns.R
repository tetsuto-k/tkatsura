NucleusDrop <- c(
  "6 Flawed Ruby", "12 Flawed Ruby", "24 Flawed Ruby",
  "40 Flawed Ruby", "Fine Ruby", "Flawless Ruby",
  "6 Flawed Amethyst", "12 Flawed Amethyst", "24 Flawed Amethyst",
  "40 Flawed Amethyst", "Fine Amethyst", "Flawless Amethyst",
  "6 Flawed Jade", "12 Flawed Jade", "24 Flawed Jade",
  "40 Flawed Jade", "Fine Jade", "Flawless Jade",
  "6 Flawed Amber", "12 Flawed Amber", "24 Flawed Amber",
  "40 Flawed Amber", "Fine Amber", "Flawless Amber",
  "6 Flawed Sapphire", "12 Flawed Sapphire", "24 Flawed Sapphire",
  "40 Flawed Sapphire", "Fine Sapphire", "Flawless Sapphire",
  "6 Flawed Topaz", "12 Flawed Topaz", "24 Flawed Topaz",
  "40 Flawed Topaz", "Fine Topaz", "Flawless Topaz",
  "6 Flawed Jasper", "12 Flawed Jasper", "24 Flawed Jasper",
  "40 Flawed Jasper", "Fine Jasper", "Flawless Jasper",
  "Divan Fragment", "Prehistoric Egg", "Oil Barrel", "Helix",
  "Ruby Crystal", "Jasper Crystal", "Pickonimbus 2000", "Bob-omb", 
  "Jaderald", "Wishing Compass", "5 Treasurite", "10 Treasurite", "Recall Potion", 
  "Gemstone Mixture", "Fortune IV", "Quick Claw", "Precious Pearl"
)
NucleusDropCounts <- c(
  6, 12, 24, 40, 1, 1,
  6, 12, 24, 40, 1, 1,
  6, 12, 24, 40, 1, 1,
  6, 12, 24, 40, 1, 1,
  6, 12, 24, 40, 1, 1,
  6, 12, 24, 40, 1, 1,
  6, 12, 24, 40, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 5, 10, 1, 1, 1, 1, 1
)

NucleusDropRates <- c(
  1/15.17, 1/30.35, 1/60.7, 1/151.75, 1/337.22, 1/20233,
  1/15.17, 1/30.35, 1/60.7, 1/151.75, 1/337.22, 1/20233,
  1/15.17, 1/30.35, 1/60.7, 1/151.75, 1/337.22, 1/20233,
  1/15.17, 1/30.35, 1/60.7, 1/151.75, 1/337.22, 1/20233,
  1/15.17, 1/30.35, 1/60.7, 1/151.75, 1/337.22, 1/20233,
  1/15.17, 1/30.35, 1/60.7, 1/151.75, 1/337.22, 1/20233,
  1/30.35, 1/60.7, 1/151.75, 1/433.56, 1/1517.48, 1/60699.13,
  1/50.58, 1/60.7, 1/30.35, 1/75.87, 1/121.4, 1/121.4,
  1/30.35, 1/25.29, 1/209.31, 1/606.99, 1/151.75, 1/1516.23,
  1/1213.98, 1/433.56, 1/433.56, 1/6069.9, 1/1213.98
)
sum(NucleusDropRates)
NucleusRun <- function() {
  dropRolls <- sample(14:20, 1, T)
  dropResult <- sample(NucleusDrop, dropRolls, T, NucleusDropRates)
  if (sample(c(0,1),1,T,c(1-1/1600, 1/1600))) {
    dropResult <- c(dropResult, "Divan Alloy")
    print("hapon has dropped an Divan's Alloy!")
  }
  return(c(dropRolls, dropResult))
}

DoNucleusRuns <- function(runs = 1) {
  totalLoot <- c()
  totalRolls <- 0
  for (i in 1:runs) {
    run <- NucleusRun()
    totalLoot <- c(totalLoot, run[2:length(run)])
    totalRolls <- totalRolls + as.integer(run[1])
  }
  print(paste("Total Rolls:", totalRolls))
  gemstoneOrder <- c("Ruby", "Amethyst", "Jade", "Amber", "Sapphire", "Topaz", "Jasper")
  for (j in 0:6) {
    countFlawed <- sum(6*sum(totalLoot == NucleusDrop[6*j+1]),
                       12*sum(totalLoot == NucleusDrop[6*j+2]),
                       24*sum(totalLoot == NucleusDrop[6*j+3]),
                       40*sum(totalLoot == NucleusDrop[6*j+4]))
    compactFine <- floor(countFlawed/80)
    countFlawed <- countFlawed - compactFine*80
    print(paste("Flawed ", gemstoneOrder[j+1], ": ", countFlawed, sep = ""))
    print(paste("Fine ", gemstoneOrder[j+1], ": ", sum(totalLoot == NucleusDrop[6*j+5])+compactFine, sep = ""))
    print(paste("Flawless ", gemstoneOrder[j+1], ": ", sum(totalLoot == NucleusDrop[6*j+6]), sep = ""))
  }
  for (j in NucleusDrop[43:52]) {
    if (j == "Bob-omb") {
      print(paste(j, ": ", 16*sum(totalLoot == j), sep = ""))
    } else {
      print(paste(j, ": ", sum(totalLoot == j), sep = ""))
    }
  }
  print(paste("Treasurite: ",
              5*sum(totalLoot == "5 Treasurite") + 10*sum(totalLoot == "10 Treasurite"), sep = ""))
  for (j in NucleusDrop[55:59]) {
    print(paste(j, ": ", sum(totalLoot == j), sep = ""))
  }
  print(paste("Divan Alloys:", sum(totalLoot == "Divan Alloy")))
}
DoNucleusRuns(1000)
