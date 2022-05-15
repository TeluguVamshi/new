- dashboard: bug_t
  title: bug_t
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: bug_t
    name: bug_t
    model: vamshi-project
    explore: order_items
    type: looker_grid
    fields: [orders.id, products.brand, count_of_user_id]
    sorts: [count_of_user_id desc 0]
    limit: 500
    dynamic_fields: [{measure: count_of_brand, based_on: products.brand, expression: '',
        label: Count of Brand, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {category: measure, expression: '', label: Count of User ID, based_on: orders.user_id,
        _kind_hint: measure, measure: count_of_user_id, type: count_distinct, _type_hint: number},
      {measure: sum_of_id, based_on: products.id, expression: '', label: Sum of ID,
        type: sum, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
