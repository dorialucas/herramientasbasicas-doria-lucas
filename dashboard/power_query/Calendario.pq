// Consulta "Calendario": 1 fila por día, años completos
// Se relaciona por Fecha con Costo Salarial[Mes] y P&L[Mes] (los dos usan el día 1 de cada mes)
let
    Fechas = List.Combine({#"Costo Salarial"[Mes], #"P&L"[Mes]}),
    Desde = #date(Date.Year(List.Min(Fechas)), 1, 1),
    Hasta = #date(Date.Year(List.Max(Fechas)), 12, 31),
    Dias = List.Dates(Desde, Duration.Days(Hasta - Desde) + 1, #duration(1, 0, 0, 0)),
    Tabla = Table.FromList(Dias, Splitter.SplitByNothing(), type table [Fecha = date]),

    Meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"},

    ConAnio = Table.AddColumn(Tabla, "Año", each Date.Year([Fecha]), Int64.Type),
    ConNumeroMes = Table.AddColumn(ConAnio, "N° de mes", each Date.Month([Fecha]), Int64.Type),
    ConNombreMes = Table.AddColumn(ConNumeroMes, "Nombre del mes", each Meses{[#"N° de mes"] - 1}, type text),
    ConMes = Table.AddColumn(ConNombreMes, "Mes", each Date.StartOfMonth([Fecha]), type date),

    // "Ene 2026" (ordenar por Orden mes-año)
    ConMesAnio = Table.AddColumn(ConMes, "Mes-Año", each Text.Start([Nombre del mes], 3) & " " & Text.From([Año]), type text),
    ConOrdenMesAnio = Table.AddColumn(ConMesAnio, "Orden mes-año", each [Año] * 100 + [#"N° de mes"], Int64.Type),

    ConTrimestre = Table.AddColumn(ConOrdenMesAnio, "Trimestre", each "T" & Text.From(Date.QuarterOfYear([Fecha])), type text),
    ConAnioTrimestre = Table.AddColumn(ConTrimestre, "Año-Trimestre", each Text.From([Año]) & "-" & [Trimestre], type text)
in
    ConAnioTrimestre
