module "networking" {
  source = "./modules/networking"

  vpc_cidr_block = "10.0.0.0/16"
  public_subnet_cidr_block_1 = "10.0.1.0/24"
  public_subnet_cidr_block_2 = "10.0.2.0/24"
}

module "compute" {
  source             = "./modules/compute"
  public_subnet_1_id = module.networking.public_subnet_1_id  # ✅ Correct reference
  public_subnet_2_id = module.networking.public_subnet_2_id  # ✅ Correct reference
  web_sg_id          = module.networking.web_sg_id           # ✅ Correct reference
}

module "autoscaling" {
  source    = "./modules/autoscaling"
  subnet_id = module.networking.public_subnet_1_id  # ✅ Correct variable name
}


module "database" {
  source = "./modules/database"
  vpc_id = module.networking.vpc_id
  public_subnet_1_id = module.networking.public_subnet_1_id
  public_subnet_2_id = module.networking.public_subnet_2_id
}

module "storage" {
  source = "./modules/storage"
}


module "cicd" {
  source = "./modules/cicd"
}