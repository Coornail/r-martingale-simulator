martingaleRun <- function(startMoney, baseBet = 1, betIncrease = 2.0) {
  mVector <- c();
  money <- startMoney;
  bet <- baseBet;
  maxMoney <- startMoney;
  maxMoneyAtStep <- 0;
  step <- 0;

  while (bet < money) {
    step <- step + 1;
    mVector[step] <- money;
    if (runif(1) < 0.495) {
      money <- money + bet;
      bet <- baseBet;
    } else {
      money <- money - bet;
      bet <- bet * betIncrease;
    }
    
    if (money > maxMoney) {
      maxMoney <- money;
      maxMoneyAtStep <- step;
    }
  }
  
  #result <- list("maxMoney" = maxMoney, "maxMoneyAtStep" = maxMoneyAtStep, "steps" = step, "bets" = mVector);
  result <- list("maxMoney" = maxMoney, "maxMoneyAtStep" = maxMoneyAtStep, "steps" = step);
}
