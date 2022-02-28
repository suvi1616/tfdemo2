terraform {
	backend "s3"{
		bucket = "suitfstate"
		key = "devopsdemo/demovpc_tfstate"
	}
}