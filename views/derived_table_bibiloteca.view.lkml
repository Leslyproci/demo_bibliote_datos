# If necessary, uncomment the line below to include explore_source.

# include: "demo_biblioteca.model.lkml"

view: count_query {
  derived_table: {
    explore_source: biblioteca_datos {
      column: codigo_biblioteca {}
      column: departamento {}
      column: count {}
    }
  }
  dimension: codigo_biblioteca {
    description: ""
  }
  dimension: departamento {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
}
