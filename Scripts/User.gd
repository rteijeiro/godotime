class_name User

var full_name: String
var email: String
var phone: String
var password: String
var hours: String

# Constructor
func _init(email, full_name, phone, password, hours = "09:00 - 17:00"):
	self.email = email
	self.full_name = full_name
	self.phone = phone
	self.password = password
	self.hours = hours
	

# Convert to String to save in files
func to_csv() -> String:
	return "%s, %s, %s, %s, %s" % [email, full_name, phone, password, hours]

# Create user from CSV
static func from_csv(line: String) -> User:
	var data = line.split(",")
	if data.size() == 5:
		return User.new(data[0], data[1], data[2], data[3], data[4])
	return null
