variable "DEP_ENV"{
	type = string
	description ="used to determine environment"
	validation{
		condition = contains(["prod","dev"],lower(var.DEP_ENV))
		error_message = "Deployment allowed in dev and prod."
	}
}
