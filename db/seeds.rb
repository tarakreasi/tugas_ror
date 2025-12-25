# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: ENV.fetch('ADMIN_EMAIL', 'admin@example.com'), password: ENV.fetch('ADMIN_PASSWORD', 'password'), password_confirmation: ENV.fetch('ADMIN_PASSWORD', 'password')) unless AdminUser.exists?(email: ENV.fetch('ADMIN_EMAIL', 'admin@example.com'))

course = Course.find_or_create_by!(title: "Ruby on Rails untuk Pemula") do |c|
  c.description = "Kursus ini akan mengajarkan Anda dasar-dasar Ruby on Rails dari awal hingga mahir."
  c.price = 50.0
  c.status = "Active"
end

Task.find_or_create_by!(title: "Pengenalan Ruby on Rails", course: course) do |t|
  t.description = "Video pengenalan tentang apa itu Ruby on Rails dan mengapa kita menggunakannya."
  t.video_url = "https://www.youtube.com/embed/dQw4w9WgXcQ"
  t.preview = true
  t.position = 1
end

Task.find_or_create_by!(title: "Instalasi Lingkungan", course: course) do |t|
  t.description = "Langkah-langkash menginstal Ruby, Rails, dan Database."
  t.video_url = "https://www.youtube.com/embed/dQw4w9WgXcQ"
  t.preview = true
  t.position = 2
end

Task.find_or_create_by!(title: "Membuat Aplikasi Pertama", course: course) do |t|
  t.description = "Mari kita buat aplikasi Rails pertama kita."
  t.video_url = "https://www.youtube.com/embed/dQw4w9WgXcQ"
  t.preview = false
  t.position = 3
end

course2 = Course.find_or_create_by!(title: "Advanced Ruby Patterns") do |c|
  c.description = "Pelajari pola desain tingkat lanjut dalam bahasa pemrograman Ruby."
  c.price = 75.0
  c.status = "Active"
end

Task.find_or_create_by!(title: "Metaprogramming di Ruby", course: course2) do |t|
  t.description = "Memahami kekuatan metaprogramming untuk membuat kode yang lebih fleksibel."
  t.video_url = "https://www.youtube.com/embed/dQw4w9WgXcQ"
  t.preview = true
  t.position = 1
end
