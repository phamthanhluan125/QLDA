Admin.create!(
  name: "Pham Thanh Luan",
  email: "bo@gmail.com",
  password: "Aa@123"
  )
Role.create!(
  id: 1,
  name: "Designer",
  admin_id: 1
  )
Role.create!(
  id: 2,
  name: "Tester",
  admin_id: 1
  )
Role.create!(
  id: 3,
  name: "Developer",
  admin_id: 1
  )

User.create!(
  name: "Nhan Vien 1",
  email: "nv1@gmail.com",
  password: "Aa@123",
  time_scr: 5,
  role_id: 1,
  admin_id: 1,
  password_confirmation: "Aa@123"
  )
User.create!(
  name: "Nhan Vien 2",
  email: "nv2@gmail.com",
  password: "Aa@123",
  time_scr: 5,
  role_id: 2,
  admin_id: 1,
  password_confirmation: "Aa@123"
  )

