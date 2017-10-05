
<!-- README.md is generated from README.Rmd. Please edit that file -->
shinyCAPTCHA
============

The goal of shinyCAPTCHA is to provide google reCAPTCHA to Shiny apps. reCAPTCHA is a tool to prevent computers from spamming your websites forms.

Installation
------------

You can install shinyCAPTCHA from github with:

``` r
# install.packages("devtools")
devtools::install_github("CannaData/shinyCAPTCHA")
```

Example
-------

``` r
library(shiny)
library(shinyCAPTCHA)

ui <- fluidPage(
  recaptchaUI("test", sitekey = "6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"),
  uiOutput("humansOnly")
)

server <- function(input, output, session) {
  
  result <- callModule(recaptcha, "test", secret = "6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe")
  
  output$humansOnly <- renderUI({
    req(result()$success)
    tags$h1("For human eyes only!")
  })
  
}

shinyApp(ui, server)
```
