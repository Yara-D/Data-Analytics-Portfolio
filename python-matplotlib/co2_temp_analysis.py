# ==============================================================================
# 2. Relação CO2 vs. Temperatura com Mapeamento Temporal (Scatter Plot)
# ==============================================================================
import pandas as pd
import matplotlib.pyplot as plt

fig, ax = plt.subplots()

# Scatter plot mapeando o tempo/índice na cor dos pontos (c)
ax.scatter(climate_change["co2"], climate_change["relative_temp"], c=climate_change.index)

# Rotulagem clara das variáveis
ax.set_xlabel("CO2 (ppm)")
ax.set_ylabel("Relative temperature (C)")

# Exportar em alta resolução
fig.savefig("images/co2_vs_temp.png", dpi=300)
plt.show()
