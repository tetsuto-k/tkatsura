library(ggplot2)
library(dplyr)
slayerChance <- data.frame(runs = 5:20000, shard = 0, shardCum = 0, heart = 0, heartCum = 0)
shardChance <- 1/1814
heartChance <- 1/7246

for (i in 1:nrow(slayerChance)) {
  slayerChance$shard[i] <- choose(i+4, 3)*(shardChance**4)*((1-shardChance)**i)
  slayerChance$heart[i] <- heartChance*(1-heartChance)**(i+3)
  if (i == 1) {
    slayerChance$shardCum[i] <- slayerChance$shard[i]
    slayerChance$heartCum[i] <- slayerChance$heart[i]
  } else {
    slayerChance$shardCum[i] <- slayerChance$shard[i] + slayerChance$shardCum[i-1]
    slayerChance$heartCum[i] <- slayerChance$heart[i] + slayerChance$heartCum[i-1]
  }
}
ggplot(slayerChance, aes(x=runs)) + geom_point(aes(y=shard), color="red") + geom_point(aes(y=heart), color="blue")
ggplot(slayerChance, aes(x=runs)) + geom_point(aes(y=shardCum), color="purple") + geom_point(aes(y=heartCum), color="black")
