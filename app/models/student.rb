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

def self.search(name)
	if name.empty?
		self.all
	else
	#Student.connection.select_all("SELECT name FROM students WHERE name LIKE ?")
	 where('NAME like ?', "%#{name}%")
	end


end

end
