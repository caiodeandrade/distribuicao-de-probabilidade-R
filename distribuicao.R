library("ggplot2")

dfNBA <- read.csv(file = 'all_seasons.csv')

ynba <- dfNBA[, 6]#definindo o eixo "y"
dim <- length(ynba)
print("Numero de jogadores avaliados: ")
print(dim)


xnba <- seq(from = 0, to = dim - 1 , by = 1)#definindo o eixo "y"
dfNBA_altura <- data.frame(x = xnba, y = ynba )
p <- ggplot(dfNBA_altura, aes(x = x, y = y)) + geom_line(color="darkblue")
print(p)

#tirando a media da base de dados e o desvio padrão
media_nba <- mean(ynba)
desvio_padrao_nba <- sd(ynba)
print("Media de altura dos jogadores da NBA:")
print(media_nba)
print("Desvio Padrão dos jogadoes da NBA:")
print(desvio_padrao_nba)

#plotando histograma da base de dados
pp <- ggplot(dfNBA, aes(x = player_weight)) +
    geom_histogram(binwidth = 1, color="darkblue", fill="lightblue" )
print(pp)

#plotando histograma com uma distribuição de probabilidade da base de dados
ppp <- ggplot(dfNBA, aes(x = player_weight)) +
    geom_histogram(binwidth = 1, aes(y = stat(density)), color="darkblue", fill="lightblue" ) +
    stat_function(fun = function(x) {dnorm(x, mean = media_nba, sd = desvio_padrao_nba)}, color="red" )
print(ppp)
