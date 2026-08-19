import pandas as pd
import matplotlib.pyplot as plt

# ==============================================================================
# 1. Análise de Variabilidade Corporal em Atletas Olímpicos (Barras com Erro)
# ==============================================================================

# Obter esportes únicos
sports = summer_2016_medals["Sport"].unique()

# Criar figura e eixos
fig, ax = plt.subplots()

# Iterar sobre cada esporte para calcular média e desvio-padrão de peso
for sport in sports:
    sport_df = summer_2016_medals[summer_2016_medals["Sport"] == sport]
    ax.bar(sport, sport_df["Weight"].mean(), yerr=sport_df["Weight"].std())

# Configurações do gráfico
ax.set_ylabel("Weight (kg)")
ax.set_xticklabels(sports, rotation=90)

# Exportar imagem para o repositório
fig.savefig("images/sports_weights.png", dpi=300)
plt.show()
