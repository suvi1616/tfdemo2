terraform {
	backend "s3"{
		bucket = "suitfstate"
		key = "dev/demoinstance_tfstate"
	}
}