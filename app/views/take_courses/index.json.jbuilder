json.array!(@take_courses) do |take_course|
  json.extract! take_course, :course_id, :cart_id
  json.url take_course_url(take_course, format: :json)
end
