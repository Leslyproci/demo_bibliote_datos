connection: "biblioteca"

# include all the views
include: "/views/**/*.view"

datagroup: demo_biblioteca_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: demo_biblioteca_default_datagroup

explore: datos_biblioteca {
  join: lugar_de_los_datos {
    type: left_outer
    sql: ${datos_biblioteca.codigo_biblioteca}=${lugar_de_los_datos.codigo_biblioteca_1} ;;
    relationship: many_to_one
  }
}
