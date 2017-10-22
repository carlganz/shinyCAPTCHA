#' Client-side module component
#' @export
#' @param id unique id for module
#' @param sitekey Google sitekey code for reCAPTCHA
#' @param ... values passed onto input
#' @import htmltools
#' @importFrom shiny NS
recaptchaUI <- function(id, sitekey = Sys.getenv("recaptcha_sitekey"), ...) {
  ns <- NS(id)
  
  tagList(tags$div(
    shiny::tags$script(
      src = "https://www.google.com/recaptcha/api.js",
      async = NA,
      defer = NA
    ),
    tags$script(
      paste0("shinyCaptcha = function(response) {
          Shiny.onInputChange('", ns("recaptcha_response"),"', response);
      }"
    )),
    tags$form(
      class = "shinyCAPTCHA-form",
      action = "?",
      method = "POST",
      tags$div(class = "g-recaptcha", `data-sitekey` = sitekey, `data-callback` = I("shinyCaptcha")),
      tags$br(),
      tags$input(type = "submit", ...)
    )
  ))
}

