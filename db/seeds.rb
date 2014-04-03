# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Role.create!([
  {name: "disabled", value: 1},
  {name: "banned", value: 2},
  {name: "normal", value: 10},
  {name: "mod", value: 100},
  {name: "admin", value: 200},
  {name: "superadmin", value: 500}
])

userpw = SecureRandom.hex(64)


# fallback profile for deleted users
deleted_user = User.create!(
  uuid: "8667ba71b85a4004af54457a9734eed7",
  name: "Deleted user",
  email: "redstonerserver@gmail.com",
  ign: "Steve",
  about: "Hey, apparently, I do no longer exist. This is just a placeholder profile",
  password: userpw,
  password_confirmation: userpw,
  role: Role.get(:disabled),
  skype: "echo123",
  skype_public: true,
  last_ip: "0.0.0.0",
  confirmed: true,
  last_seen: Time.utc(0).to_datetime
)
deleted_user.update_attribute(:ign, "Steve")

User.create!(
  uuid: "9ff3d74f716940a3aa6f262ab632d2",
  ign: "redstone_sheep",
  email: "theredstonesheep@gmail.com",
  password: "123456789", # high seructity!
  password_confirmation: "123456789",
  role: Role.get(:superadmin)
)