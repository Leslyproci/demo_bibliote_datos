view: lugar_de_los_datos {
  sql_table_name: `Demo.Lugar_de_los_datos`
    ;;

  dimension: codigo_biblioteca_1 {
    type: string
    sql: ${TABLE}.Codigo_biblioteca_1 ;;
  }

  dimension: departamento {
    type: string
    sql: ${TABLE}.Departamento ;;
  }

  dimension: georeferencia {
    type: string
    sql: ${TABLE}.Georeferencia ;;
  }

  dimension: latitud {
    type: number
    sql: ${TABLE}.Latitud ;;
  }

  dimension: longitud {
    type: number
    sql: ${TABLE}.Longitud ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
