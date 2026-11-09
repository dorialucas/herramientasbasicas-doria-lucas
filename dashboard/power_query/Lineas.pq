// Consulta "Lineas": 1 fila por línea de servicio, para filtrar Costo Salarial y P&L con el mismo segmentador
// Los nombres tienen que coincidir con la columna "Línea de servicio" de las dos tablas
// "Total base" = hoja general del P&L (no existe en Costo Salarial)
let
    Lineas = #table(
        type table [#"Línea de servicio" = text, Orden = Int64.Type, #"Es línea" = logical],
        {
            {"Fractura", 1, true},
            {"SCBP", 2, true},
            {"WT", 3, true},
            {"Wireline", 4, true},
            {"Resto", 5, false},
            {"Total base", 6, false}
        })
in
    Lineas
