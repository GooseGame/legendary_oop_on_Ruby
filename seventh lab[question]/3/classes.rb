load 'interfaces.rb'

class PersonImpl
	def initialize(name,
								surname='',
								middleName='',
								adress='')
		@name = name
		@surname = surname
		@middleName = middleName
		@adress = adress
	end
	def name
		@name
	end
	def surname(val = nil)
		if val == nil
			return @surname
		else
			return @surname = val
		end		
	end
	def middleName(val = nil)
		if val == nil
			return @middleName
		else
			return @middleName = val
		end		
	end
	def adress(val = nil)
		if val == nil
			return @adress
		else
			return @adress = val
		end
	end			
	implements IPerson
end	

class Student < PersonImpl
	def initialize(name,
								surname='',
								middleName='',
								adress='')
		super
		@univercity = ''
		@studentNum = ''
	end
	def univercity(val = nil)
		if val == nil
			return @univercity
		else
			return @univercity = val
		end
	end	
	def studentNum(val = nil)
		if val == nil
			return @studentNum
		else
			return @studentNum = val
		end
	end
	implements IStudent
end	

class AdvStudent < Student
	def initialize(name,
								surname='',
								middleName='',
								adress='')
		super
		@dissertation=''
	end
	def dissertation(val = nil)
		if val == nil
			return @dissertation
		else
			return @dissertation = val
		end
	end	
	implements IAdvStudent
end

class Teacher < PersonImpl
	def initialize(name,
								surname='',
								middleName='',
								adress='')
		super
		@subject=''
	end
	def subject(val = nil)
		if val == nil
			return @subject
		else
			return @subject = val
		end
	end	
implements ITeacher
end

class Pupil < PersonImpl
	def initialize(name,
								surname='',
								middleName='',
								adress='')
		super
		@school=''
		@schoolClass = ''
	end
	def school(val = nil)
		if val == nil
			return @school
		else
			return @school = val
		end
	end	
	def schoolClass(val = nil)
		if val == nil
			return @schoolClass
		else
			return @schoolClass = val
		end
	end	
implements IPupil
end

class Worker < PersonImpl
	def initialize(name,
								surname='',
								middleName='',
								adress='')
		super
		@specialty=''
	end
	def specialty(val = nil)
		if val == nil
			return @specialty
		else
			return @specialty = val
		end
	end	
implements IWorker
end


mk = PersonImpl.new('Mark')
mV = Student.new('Newbie')