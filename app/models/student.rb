# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  def self.search(keyword)
    if keyword ==" " || nil
  		self.all
    else
    	sql="SELECT * FROM students WHERE name LIKE ?"
    	Student.find_by_sql([sql,keyword+"%"])
    end
    end
end