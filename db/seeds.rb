Manager.create!(
  name: "Pham Thanh Luan",
  email: "bo@gmail.com",
  birthday: "20/11/1990",
  password: "Aa@123",
  password_confirmation: "Aa@123"
  )
Role.create!(
  id: 1,
  name: "Designer",
  manager_id: 1
  )
Role.create!(
  id: 2,
  name: "Tester",
  manager_id: 1
  )
Role.create!(
  id: 3,
  name: "Developer",
  manager_id: 1
  )

User.create!(
  name: "Nhan Vien 1",
  email: "nv1@gmail.com",
  birthday: "20/11/1990",
  time_scr: 5,
  role_id: 1,
  manager_id: 1,
  password: "Aa@123",
  password_confirmation: "Aa@123",
  authentication_token: Devise.friendly_token
  )
User.create!(
  name: "Nhan Vien 2",
  email: "nv2@gmail.com",
  birthday: "20/11/1990",
  time_scr: 5,
  role_id: 2,
  manager_id: 1,
  password: "Aa@123",
  password_confirmation: "Aa@123",
  authentication_token: Devise.friendly_token
  )
User.create!(
  name: "Nhan Vien 3",
  email: "nv3@gmail.com",
  birthday: "20/11/1990",
  time_scr: 5,
  role_id: 2,
  manager_id: 1,
  password: "Aa@123",
  password_confirmation: "Aa@123",
  authentication_token: Devise.friendly_token
  )
User.create!(
  name: "Nhan Vien 4",
  email: "nv4@gmail.com",
  birthday: "20/11/1990",
  time_scr: 5,
  role_id: 2,
  manager_id: 1,
  password: "Aa@123",
  password_confirmation: "Aa@123",
  authentication_token: Devise.friendly_token
  )
User.create!(
  name: "Nhan Vien 5",
  email: "nv5@gmail.com",
  birthday: "20/11/1990",
  time_scr: 5,
  role_id: 2,
  manager_id: 1,
  password: "Aa@123",
  password_confirmation: "Aa@123",
  authentication_token: Devise.friendly_token
  )
Project.create!(
  name: "Thiết kế website ABC",
  info: "Xây dựng website trường học ABC Đà Nẵng",
  start_date: "1/08/2016",
  deadline: "01/7/2017",
  manager_id: 1
  )
Project.create!(
  name: "Phầm mềm quản lý thư viện trường đai học ĐÔNG TÂY",
  info: "Phầm mềm quản lý thư viện trường đai học ĐÔNG TÂY",
  start_date: "1/10/2017",
  deadline: "01/7/2018",
  manager_id: 1
  )
Project.create!(
  name: "Ứng dụng quản cáo trên di dộng M-Share",
  info: "Ứng dụng quản cáo trên di dộng M-Share",
  start_date: "1/08/2017",
  deadline: "01/12/2017",
  manager_id: 1
  )
Project.create!(
  name: "Website thương mại công ty NAM Á",
  info: "",
  start_date: "1/08/2016",
  deadline: "01/7/2017",
  manager_id: 1
  )
