data "terraform_remote_state" "my_subnet_id" {
  backend = "s3"
  config = {
    bucket = "suitfstate"
    key    = "dev/demovpc_tfstate"
    region = "us-east-1"
  }
}

module "dev-secgrp"{
	source = "../../Modules/secgrp"
	secgrp_name="demo-sec-grp"
	vpc_id = data.terraform_remote_state.my_subnet_id.outputs.vpc_id
}

module "dev-inst"{
	source = "../../Modules/instance"
	inst_type = "t3.micro"
	secgrp_ids = [module.dev-secgrp.sec_grp_id]
	instance_name = "demo-instance"
	sn_id = data.terraform_remote_state.my_subnet_id.outputs.subnet_id
}