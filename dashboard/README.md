# Dashboard – KPI Mano de Obra

Archivo: [kpi_mano_de_obra.pbix](kpi_mano_de_obra.pbix) (Power BI Desktop). Exportado a PDF en [kpi_mano_de_obra.pdf](kpi_mano_de_obra.pdf) para verlo sin Power BI.

## Páginas

| Página | Qué muestra |
|---|---|
| Nómina Total | nómina actual, variación de nómina, evolución mensual y nómina por línea |
| Nómina por línea | nómina de cada línea, participación % y variación vs. el primer mes |
| Costo nominal por línea | evolución del costo laboral total y por línea, mediana mensual por línea |
| Ratio RO / CTN | RO y MO del período, ratio RO / MO por mes, 2026 vs 2025, tendencia y previsión |
| Ratio RO / MOI | ratio RO / mano de obra indirecta y costo por persona de los sectores indirectos |

Panel de filtros en cada página: segmentadores por **mes** y por **trimestre**. Las páginas de tooltip muestran el detalle de horas extras y de los departamentos de "Resto".

## KPIs

- **Ratio RO / MO total:** resultado operativo / (MO directa + MO indirecta), hoja general del P&L.
- **Nómina actual:** personas en el último mes del filtro.
- **Ratio RO / MOI:** resultado operativo / mano de obra indirecta.

## Modelo

| Tabla | Origen |
|---|---|
| Costo Salarial | `data/processed/costo_salarial_mensual.csv` |
| P&L | `data/processed/pl_mensual.csv` (2025 y 2026) |
| Lineas | tabla fija para filtrar las dos tablas con un mismo segmentador |
| Calendario | se genera con las fechas de las otras tablas |

El código de las consultas está en [power_query/](power_query/) y las medidas principales en [medidas.dax](medidas.dax). Para abrir el .pbix en otra PC hay que cambiar el parámetro `CarpetaRepo` a la carpeta donde se descargó el repo y actualizar.
