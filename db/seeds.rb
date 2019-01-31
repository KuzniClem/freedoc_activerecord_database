# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
Specialty.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
JoinTableDoctorSpecialty.destroy_all

5.times do
	city = City.new
	city.zip_code = Faker::Address.zip_code
	city.save
end

5.times do
	specialty = Specialty.new
	specialty.name = Faker::Job.field
	specialty.save
end

10.times do
	doctor = Doctor.new
	doctor.city = City.all.sample
	doctor.first_name = Faker::Name.unique.first_name
	doctor.last_name = Faker::Name.unique.last_name
	doctor.save
end

20.times do
	patient = Patient.new
	patient.city = City.all.sample
	patient.first_name = Faker::Name.unique.first_name
  patient.last_name = Faker::Name.unique.last_name
	patient.save
end

20.times do
	doctor = Doctor.all.sample
	doctor.specialties << Specialty.all.sample
end

40.times do
	appointment = Appointment.new
	appointment.doctor = Doctor.all.sample
	appointment.city = City.all.sample
	appointment.patient = Patient.all.sample
	appointment.date = Faker::Date.forward
	appointment.save
end
