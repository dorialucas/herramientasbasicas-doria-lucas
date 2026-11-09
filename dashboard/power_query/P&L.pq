// Consulta "P&L": lee data/processed/pl_mensual.csv
// 1 fila por Línea de servicio, Concepto y Mes (USD). "Total base" = hoja general del P&L
// MOD y MOI vienen en negativo (son costos); las medidas DAX les cambian el signo
let
    Origen = Csv.Document(
        File.Contents(CarpetaRepo & "\data\processed\pl_mensual.csv"),
        [Delimiter = ",", Encoding = 65001, QuoteStyle = QuoteStyle.Csv]),
    Encabezados = Table.PromoteHeaders(Origen, [PromoteAllScalars = true]),
    Tipos = Table.TransformColumnTypes(Encabezados, {
        {"Línea de servicio", type text},
        {"Concepto", type text},
        {"Orden concepto", Int64.Type},
        {"Mes", type date},
        {"Escenario", type text},
        {"Valor", type number}
    }, "en-US")
in
    Tipos
