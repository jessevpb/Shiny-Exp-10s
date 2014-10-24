exp10s <- function(total, kept) {
  
  roll <- sample(1:10, total, replace = TRUE)  
  tens <- sum(roll == 10) ## number of 10s in first roll
  y = list()
  z = 0
  
  if(tens > 0) {
    for(i in 1:tens) {
      x <- 10
      while(x[1] == 10) {
        x[length(x)+1] <- x[1]  ##Move 10 to end of x vector
        x[1] <- sample(1:10, 1, replace = TRUE) ##New d10 roll
      }
      y[[i]] <- x ##save as element of a list
      z[i] <- sum(x) ##save sum in a vector
    }
  }
  
  w <- list() #new list to reorder y
  
  if(length(y) < kept){ #avoid exceeding index of w
    foo <- length(y)
  } else {
    foo <- length(kept)
  }
  
  keepers <- sort(roll, decreasing = TRUE)[1:kept]## original kept numbers
  keepers <- keepers[keepers != 10] ##remove 10s (since they are in y)
  
  if(length(y) > 0) {
    for(i in 1:foo) {
      w[[i]] <- y[[which.max(z)]] #first element of w is largest sum of y
      z[which.max(z)] <- 0
    }
    for(j in 1:length(w)) { # adding exploded 10s to
      keepers <- append(keepers, w[[j]])
    }
  }
  list("Total" = sum(keepers), "Keepers" = keepers, "Original Roll" = roll)
}


shinyServer(
  function(input, output) {
    output$total <- renderPrint({input$total})
    output$kept <- renderPrint({input$kept})
    output$roll <- renderPrint({
      input$Go
      isolate({
        isoTotal <- input$total
        isoKept <- input$kept
      })
      exp10s(isoTotal, isoKept)
      })
  }
)
