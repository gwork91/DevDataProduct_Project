
data(mtcars)
fit <<- lm(mpg~wt+cyl, data=mtcars)

shinyServer(
	function(input, output){
		output$text1 <- renderText({input$text1})
		output$text2 <- renderText({input$text2})
		output$text3 <- renderText({
		#	input$goButton			# Creating the dependency on the goButton
			new.cars <<- data.frame(wt=as.numeric(input$text1), cyl=as.numeric(input$text2))
			isolate(paste("Thus we have 95 percent of cars with given ", input$text1 ," tons weight in tons having a mileage between " , round(min(predict(fit, newdata=new.cars, interval = "confidence")),3)," and ", round(max(predict(fit, newdata=new.cars, interval = "confidence")),3)," miles per gallon", sep=" "))
		})
   }

)
