plot_sctr <- function(dat, xax, yax, title, laby, labx, name) {
  dat %>% ggplot(aes(x = xax, y = yax)) +
    geom_point(shape = 1) +
    geom_smooth(method = lm, se = FALSE) + 
    custom_theme() +
    ggtitle(title) +
    ylab(laby) +
    xlab(labx) }
