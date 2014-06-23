
shinyUI(pageWithSidebar(
	headerPanel("Shiny Prediction"),
	sidebarPanel(
		h3('Mileage Prediction'),
		h4('We are using here "mtcars" dataset'),
    p('"mtcars" dataset parameters : Weight(lb/1000) and Number of Cylinders (4,6, or 8) have been used as the estimators and MPG (Miles/gallon) as the outcome variable.'),
		br(),
    p('We have applied the Linear Model fit on the "mtcars" dataset, and then we are using the model obtained on the new dataset which is taken by user input.'),
		br(),
    p('Here a 95 percent confidence interval around the mean prediction has been calculated, and the maximum and minimum values are being shown.'),
		br(),
		p('User is supposed to enter the Weight and Number of Cylinders parameter values for car :'),
    h2(''),
		textInput(inputId="text1", label = "Put Weight Parameter (wt) : Any value"),
		textInput(inputId="text2", label = "Put cylinders Parameter (cyl) : 4,6 or 8"),
		br(),
    p('* The entered value for weight should be in lb/1000.'),
    p('** Cylinders present to be in numbers 4,6,8.'),
		br(),
    h4(' Server side Calculations :'),
		p('fit <<- lm(mpg~wt+cyl, data=mtcars)'),
    p('new.cars <<- data.frame(wt=as.numeric(input$text1), cyl=as.numeric(input$text2))'),
    p('round(min(predict(fit, newdata=new.cars, interval = "confidence")),3)'),
		p('round(max(predict(fit, newdata=new.cars, interval = "confidence")),3)'),
		br(),
		p('One can use the command "runApp(display.mode= "showcase")" to see both "ui.R" and "server.R" codes ')
	),
	
	mainPanel(
		p('MtCar Weight'),
		textOutput('text1'),
		p('MtCar number of cylinders'),
		textOutput('text2'),
		p('Prediction for Miles per gallon (mpg)'),
		textOutput('text3')
	)

))

