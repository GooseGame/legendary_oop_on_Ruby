require "interface"

IPerson = interface{
	required_methods :name,
									 :surname,
									 :middleName, 
									 :adress
}

IPupil = interface{
	extends IPerson
	required_methods :school, 
									 :schoolClass
}

ITeacher = interface{
	extends IPerson
	required_methods :subject
}

IStudent = interface{
	extends IPerson
	required_methods :univercity,
									 :studentNum
}

IAdvStudent = interface{
	extends IStudent
	required_methods :dissertation
}

IWorker = interface{
	extends IPerson
	required_methods :specialty
}