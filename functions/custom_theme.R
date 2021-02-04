custom_theme <- function() {
  t <- theme(axis.title.x = element_text(size = 15, margin = margin(t = 10, r = 0, b = 10, l = 0)),
             axis.title.y = element_text(size = 15, margin = margin(t = 0, r = 10, b = 0, l = 10)),
             axis.text.x = element_text(size = 14),
             axis.text.y = element_text(size = 14),
             panel.background = element_rect(fill = "white"),
             axis.line.x = element_line(color = "black"),
             axis.line.y = element_line(color = "black"),
             legend.position="none",
             plot.title = element_text(size=20, hjust = 0.5, margin = margin(t = 20, r = 0, b = 20, l = 0) ) )}

