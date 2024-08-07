connection: "biblioteca"

# include all the views
include: "/views/**/*.view"

datagroup: demo_biblioteca_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: demo_biblioteca_default_datagroup

explore: biblioteca_datos {
 access_filter: {
   field: universidad
    user_attribute: universidad
  }
  #access_filter: {
  #  field: cantidad_consultas
  #  user_attribute: correo
  #}
}
explore: datos_biblioteca {
 # always_filter: {
  #  filters: [datos_biblioteca.biblioteca_consulta: "Biblioteca virtual"
   #   , datos_biblioteca.biblioteca_consulta: "Biblioteca principal"]
  #}
}
