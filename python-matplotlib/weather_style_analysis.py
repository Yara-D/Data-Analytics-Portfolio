import pandas as pd
import matplotlib.pyplot as plt
==============================================================================
# 3. Estilização para Relatórios Técnicos (Customização e Redimensionamento)
# ==============================================================================

# Aplicar estilo profissional
plt.style.use('ggplot')

fig, ax = plt.subplots()

# Plotagem de dados meteorológicos
ax.plot(seattle_weather["MONTH"], seattle_weather["MLY-TAVG-NORMAL"], label="Seattle")
ax.plot(austin_weather["MONTH"], austin_weather["MLY-TAVG-NORMAL"], label="Austin")

# Formatação e dimensão para apresentações
ax.set_ylabel("Temperature (Fahrenheit)")
fig.set_size_inches([5, 3])

# Salvar figura formatada
fig.savefig("images/weather_comparison_ggplot.png", dpi=300)
plt.show()
