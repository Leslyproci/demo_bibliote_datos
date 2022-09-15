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
}
