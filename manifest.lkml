
constant: GCP_PROJECT {
  value: "{{ _user_attributes['conexion'] }}"
  ##value: "analitica-demos"
  export: override_required
}
