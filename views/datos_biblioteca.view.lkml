view: datos_biblioteca {
  sql_table_name: `Demo.Datos_biblioteca`
    ;;

  dimension: anio_registro_usuario_sistema {
    type: number
    sql: ${TABLE}.Anio_registro_usuario_sistema ;;
  }

  dimension: biblioteca_consulta {
    type: string
    sql: ${TABLE}.Biblioteca_consulta ;;
  }

  dimension: cantidad_consultas {
    type: number
    sql: ${TABLE}.Cantidad_consultas ;;
  }

  dimension: codigo_biblioteca {
    type: string
    sql: ${TABLE}.Codigo_biblioteca ;;
  }

  dimension: codigo_de_preferencia_de_aviso {
    type: string
    sql: ${TABLE}.Codigo_de_preferencia_de_aviso ;;
  }

  dimension: codigo_universidad {
    type: number
    sql: ${TABLE}.Codigo_universidad ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: wtd_only {
    group_label: "To-Date Filters"
    label: "WTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DOW FROM ${fecha_raw}) < EXTRACT(DOW FROM GETDATE())
                    OR
                (EXTRACT(DOW FROM ${fecha_raw}) = EXTRACT(DOW FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${fecha_raw}) < EXTRACT(HOUR FROM GETDATE()))
                    OR
                (EXTRACT(DOW FROM ${fecha_raw}) = EXTRACT(DOW FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${fecha_raw}) <= EXTRACT(HOUR FROM GETDATE()) AND
                EXTRACT(MINUTE FROM ${fecha_raw}) < EXTRACT(MINUTE FROM GETDATE())))  ;;
  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${fecha_raw}) < EXTRACT(DAY FROM GETDATE())
                    OR
                (EXTRACT(DAY FROM ${fecha_raw}) = EXTRACT(DAY FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${fecha_raw}) < EXTRACT(HOUR FROM GETDATE()))
                    OR
                (EXTRACT(DAY FROM ${fecha_raw}) = EXTRACT(DAY FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${fecha_raw}) <= EXTRACT(HOUR FROM GETDATE()) AND
                EXTRACT(MINUTE FROM ${fecha_raw}) < EXTRACT(MINUTE FROM GETDATE())))  ;;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${fecha_raw}) < EXTRACT(DOY FROM GETDATE())
                    OR
                (EXTRACT(DOY FROM ${fecha_raw}) = EXTRACT(DOY FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${fecha_raw}) < EXTRACT(HOUR FROM GETDATE()))
                    OR
                (EXTRACT(DOY FROM ${fecha_raw}) = EXTRACT(DOY FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${fecha_raw}) <= EXTRACT(HOUR FROM GETDATE()) AND
                EXTRACT(MINUTE FROM ${fecha_raw}) < EXTRACT(MINUTE FROM GETDATE())))  ;;
  }
  dimension: item {
    type: number
    sql: ${TABLE}.Item ;;
  }

  dimension: medio_de_preferenica_de_aviso {
    type: string
    sql: ${TABLE}.Medio_de_preferenica_de_aviso ;;
  }

  dimension: proporciono_direccion_de_correo {
    type: string
    sql: ${TABLE}.Proporciono_direccion_de_correo ;;
  }

  dimension: reservas_totales {
    type: number
    sql: ${TABLE}.Reservas_totales ;;
  }

  dimension: universidad {
    type: string
    sql: ${TABLE}.Universidad ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
###### se crea la constante
  dimension: cliente {
    type: string
    sql: "copalcol";;
  }

}
