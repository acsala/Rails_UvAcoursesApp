json.array!(@line_courses) do |line_course|
  json.extract! line_course, :course_id, :cart_id
  json.url line_course_url(line_course, format: :json)
end
