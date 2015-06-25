FactoryGirl.define do
  factory :widget do
    name "Widget Name"
    location_x 10
    location_y 10
    width 200
    height 150
    custom_field_types {}
    template_fields ({field1: "value"})
    custom_fields {}
    widget_template
  end

  factory :widget_template do
    title "Widget Template"
  end
end
