### Analizando distribui��es dados sa�da


# Lembram do que o professor ensinou na aula passada? Ent�o, basicamente
# para verificar se os dados seguem uma distribui��o aleat�ria, vamos
# gerar uma distribui��o aleat�ria esperada baseada nos nossos dados
# O pacote goodfit faz isso automaticamente pra gente:
install.packages("vcd")
library(vcd)


extinctData = read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e6MassExtinctions.csv"))

View(extinctData)

# Vamos gerar a distribui��o e realizar o teste de qui quadrado, para
# verificar a hip�tese de que os dados seguem uma distribui��o de poisson:
# Verificamos primeiro com a poisson pois, caso a distribui��o
# seja de poisson, significa que a distribui��o � aleat�ria, portanto
# tende a n�o seguir padr�es. Confirmando isso, sabemos que segue um
# padr�o e, podemos ir atras dele. Em distribui��es uniformes
# temos a m�dia maior (ou ligeiramente menor) que a vari�ncia,
# sendo que a divis�o m�dia/vari�ncia > 1, em contrapartida
# a=uma distribui��o agregada tem m�dia menor que vari�ncia,
# sendo que a divis�o m�dia/vari�ncia <1.
p = goodfit(extinctData$numberOfExtinctions,type = "poisson")
hist(extinctData$numberOfExtinctions)


?goodfit
# Para verificarmos o resultado do qui quadrado usamos o summary
summary(p)

# H0:Segue a dist. aleat�ria
# H1: N�o segue dist. aleat�ria

# p >0.05 = Aceita H0
# p <0.05 = Rejeita H0

# Conclus�o : Rejeito H0; N�o segue uma distribui��o aleat�ria
