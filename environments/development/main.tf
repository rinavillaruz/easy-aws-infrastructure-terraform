module "keypair" {
    source          =   "../../modules/keypair"
}

module "networking" {
    source          =   "../../modules/networking"
}

module security_groups {
  source            =   "../../modules/security_groups"

  vpc_id            =   module.networking.vpc_id
  vpc_cidr_block    =   module.networking.vpc_cidr_block

  depends_on        =   [ module.networking ]
}

module "compute" {

  source                    =   "../../modules/compute"

  private_subnets           =   module.networking.private_subnets
  public_subnets            =   module.networking.public_subnets
  public_security_group_id  =   module.security_groups.public_security_group_id
  private_security_group_id =   module.security_groups.private_security_group_id
  key_pair_name             =   module.keypair.key_pair_name
  tls_private_key_pem       =   module.keypair.tls_private_key_pem
  vpc_id                    =   module.networking.vpc_id

  depends_on                =   [ module.keypair, module.networking, module.security_groups ]
  
}