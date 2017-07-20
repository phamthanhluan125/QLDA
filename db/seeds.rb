namespace :db do
  desc "TODO"
  task make_data: [:create_user, :create_role, :create_user_manager] do
  end
  task create_user: :environment do
    User.create!(
      name: "Pham Thanh Luan",
      email: "pham.thanh.luan.1@gmail.com",
      is_manager: true,
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )
     User.create!(
      name: "Nhan Vien 1",
      email: "nv1@gmail.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )
     User.create!(
      name: "Nhan Vien 2",
      email: "nv2@gmail.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )
  end
  task create_role: :environment do
    Role.create!(
      id: 1,
      name: "Designer"
    )
     Role.create!(
      id: 2,
      name: "Tester"
    )
     Role.create!(
      id: 3,
      name: "Developer"
    )
  end
  task create_user_manager: :environment do
    UserManager.create!(
      time_scr: 5,
      manager_id: 1,
      staff_id: 2
    )
    UserManager.create!(
      time_scr: 5,
      manager_id: 1,
      staff_id: 3
    )
  end
end
