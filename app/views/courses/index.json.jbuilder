json.array!(@courses) do |course|
  json.extract! course, :Name, :Ects, :Institute, :Programme, :Description
  json.url course_url(course, format: :json)
end
