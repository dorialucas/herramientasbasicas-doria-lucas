// Consulta "Costo Salarial": lee la tabla que arma el notebook (data/processed/costo_salarial_mensual.csv)
// 1 fila por departamento/línea y mes
// Requiere el parámetro CarpetaRepo = carpeta donde está clonado el repo (ej.: C:\...\herramientasbasicas-doria-lucas)
let
    Origen = Csv.Document(
        File.Contents(CarpetaRepo & "\data\processed\costo_salarial_mensual.csv"),
        [Delimiter = ",", Encoding = 65001, QuoteStyle = QuoteStyle.Csv]),
    Encabezados = Table.PromoteHeaders(Origen, [PromoteAllScalars = true]),

    // el CSV usa punto decimal -> se tipa con cultura en-US
    Tipos = Table.TransformColumnTypes(Encabezados, {
        {"Mes", type date},
        {"Nombre del mes", type text},
        {"N° de mes", Int64.Type},
        {"Departamento", type text},
        {"Línea de servicio", type text},
        {"Orden línea", Int64.Type},
        {"Dotación", Int64.Type},
        {"Salarios", type number},
        {"Salarios USD", type number},
        {"Costo Laboral", type number},
        {"Costo Laboral USD", type number},
        {"Horas extras 50%", type number},
        {"Horas extras 50% USD", type number},
        {"Horas extras 50% Hs", type number},
        {"Horas extras 100%", type number},
        {"Horas extras 100% USD", type number},
        {"Horas extras 100% Hs", type number}
    }, "en-US")
in
    Tipos
