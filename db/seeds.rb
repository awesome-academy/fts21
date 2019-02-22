User.create!(name: "huuhung",
             email: "huuhung1996@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             group: 1 # 0- Trainee, 1: admin, 2: ....
 )
9.times do |n|
  name  = "hung-#{n+1}"
  email = "huuhung#{n+1}@gmail.com"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               group: 0)
end

3.times do |n|
  name = "Khoa hoc so #{n+1}"
  Course.create!(name: name, description: "Mo ta #{n+1}", suppervisor_id: 1, date_start: Time.now, date_end: Time.now)
end

3.times do |n|
  name = "Chu de so #{n+1}"
  Subject.create!(name: name, description: "Mo ta #{n+1}", course_id: 1, time_day: 5, suppervisor_id: 1)
end

3.times do |n|
  name = "Task #{n+1}"
  Task.create!(name: name, description: "Mo ta Task #{n+1}", subject_id: 1)
end

