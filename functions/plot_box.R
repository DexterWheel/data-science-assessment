plot_box <- function(dat, xax, yax, fi, title, laby, labx, name) {
  dat %>% ggplot(aes(x = xax, y = yax, fill = fi)) +
    geom_boxplot() +
    custom_vir() +
    custom_theme() +
    ggtitle(title) +
    ylab(laby) +
    xlab(labx) +
    names(name) }

