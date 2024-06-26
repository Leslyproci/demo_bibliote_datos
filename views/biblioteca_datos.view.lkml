view: biblioteca_datos {
  sql_table_name: `@{GCP_PROJECT}.Demo.biblioteca_datos`
    ;;

  dimension: anio_registro_usuario_sistema {
    label: "Año de registro del usuario que reporta"
    type: number
    sql: ${TABLE}.Anio_registro_usuario_sistema ;;
  }

  dimension: biblioteca_consulta {
    label: "Biblioteca reporte"
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
    label: "sfdc_lead_id"
    type: number
    sql: ${TABLE}.Codigo_universidad ;;
  }

  dimension: departamento {
    type: string
    sql: ${TABLE}.Departamento ;;
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
    label: "sfdc_contact_id"
    type: number
    sql: ${TABLE}.Item ;;
  }

  dimension: latitud {
    type: number
    sql: ${TABLE}.Latitud ;;
  }

  dimension: longitud {
    type: number
    sql: ${TABLE}.Longitud ;;
  }

  dimension: medio_de_preferenica_de_aviso {
    type: string
    sql: ${TABLE}.Medio_de_preferenica_de_aviso ;;
  }

  dimension: nombre {
    label: "Nombre biblioteca externa"
    type: string
    sql:

    CASE WHEN {{ _user_attributes["correo"] }} = 1

    THEN ${TABLE}.Nombre

    ELSE

    ${TABLE}.Nombre

    END ;;



    html:

    {% if _user_attributes["correo"] == 1 %}

          {{ value }}

      {% else %}

      [Sin permiso]

      {% endif %}  ;;

  }

  dimension: proporciono_direccion_de_correo {
    type: string
    sql: ${TABLE}.Proporciono_direccion_de_correo ;;
  }


  dimension: reservas_totales {
    label: "Cantidad de reservas"
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

  measure: consultas {
    type: sum
    sql: ${cantidad_consultas} ;;
  }

  measure: reservas {
    type: sum
    sql: ${reservas_totales} ;;
  }

  dimension: ubicacion {
    type: location
    sql_latitude:${latitud} ;;
    sql_longitude:${longitud} ;;
  }

  #measure: count_universidades {
   # type: number
    #sql: COUNT_DISTINC(${nombre}) ;;
  #}

  measure: maximo_reservas {
    type: number
    sql: MAX(${reservas_totales}) ;;
  }

  measure: count_2023 {
    type: count
    drill_fields: []
    filters: [anio_registro_usuario_sistema: "2003"]
  }
}
