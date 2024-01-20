#' Generate a dognuts about recommendation score
#'
#' @param reco vector
#'
#' @return plotly figure
#' @export
#'
#' @examples
#' NPS_Dognuts(c(1,2,10,4,3,6,7,8))
NPS_Dognuts <- function(reco) {
  assertthat::assert_that(is.vector(reco))
  reco = as.numeric(reco)
  detracteurs = sum(reco <= 6, na.rm = T)
  neutres = sum(reco == 7 | reco == 8, na.rm = T)
  promoteurs = sum(reco >= 9, na.rm = T)
  reco = as.data.frame(rbind(promoteurs, neutres, detracteurs))
  reco_prop = round(as.data.frame(prop.table((reco)) * 100), 1)
  reco = as.data.frame(reco)
  recod = cbind(rownames(reco), reco)
  rownames(recod) = NULL
  colnames(recod) = c("reco", "count")

  fig <-
    recod %>% plotly::plot_ly(
      labels = ~ reco,
      values = ~ count,
      marker = list(colors = c('#4e9c34', '#fbb829', '#bd3131'))
    )
  fig <- fig %>% plotly::add_pie(hole = 0.6)
  fig <-
    fig %>% plotly::layout(
      title = "Repartition du NPS",
      showlegend = F,
      xaxis = list(
        showgrid = FALSE,
        zeroline = FALSE,
        showticklabels = FALSE
      ),
      yaxis = list(
        showgrid = FALSE,
        zeroline = FALSE,
        showticklabels = FALSE
      )
    )
  fig <-
    fig %>% plotly::add_annotations(
      reco_prop["promoteurs", ] - reco_prop["detracteurs", ],
      x = 0.5,
      y = 0.5,
      xref = "paper",
      yref = "paper",
      text = ,
      showarrow = F,
      font = list(
        color = "black",
        family =
          "sans serif",
        size = 30
      )
    )
  plotly::config(fig, displayModeBar = FALSE)
  return(fig)
}
