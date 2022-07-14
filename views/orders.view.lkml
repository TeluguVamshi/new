view: orders {
  #this is orders view
  #this commit is from vamshi's another branch
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created_at ;;
    html: {{ rendered_value | date: "%d-%b-%Y %I:%M %p" }} ;;
  }

  dimension: time_ref {
    datatype: timestamp
    type: date_time
    sql: CAST(${created_time} as DATETIME) ;;
    html: {{rendered_value | date:"%m/%d/%Y %H:%M"}} ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    link: {
      label: "linking"
      url: "{{count._link}}"
    }
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Break down by Day"
      value: "day"
    }
    allowed_value: {
      label: "Break down by Month"
      value: "month"
    }
  }



  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      ten_million_orders.count
    ]
  }
}
