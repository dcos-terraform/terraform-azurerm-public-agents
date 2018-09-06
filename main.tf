provider "azurerm" {}

module "pubagt-nsg" {
  source  = "dcos-terraform/nsg/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  dcos_role           = "public-agent"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  tags                = "${var.tags}"
  name_prefix         = "${var.name_prefix}"
}

module "pubagt-lb" {
  source  = "dcos-terraform/lb/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  dcos_role                 = "public-agent"
  location                  = "${var.location}"
  resource_group_name       = "${var.resource_group_name}"
  tags                      = "${var.tags}"
  name_prefix               = "${var.name_prefix}"
}

module "dcos-pubagt-instances" {
  source  = "dcos-terraform/instance/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  num_instances                = "${var.num_public_agents}"
  location                     = "${var.location}"
  name_prefix                  = "${var.name_prefix}"
  instance_type                = "${var.instance_type}"
  dcos_version                 = "${var.dcos_version}"
  dcos_instance_os             = "${var.dcos_instance_os}"
  ssh_private_key_filename     = "${var.ssh_private_key_filename}"
  image                        = "${var.image}"
  disk_type                    = "${var.disk_type}"
  disk_size                    = "${var.disk_size}"
  resource_group_name          = "${var.resource_group_name}"
  network_security_group_id    = "${module.pubagt-nsg.nsg_id}"
  user_data                    = "${var.user_data}"
  admin_username               = "${var.admin_username}"
  public_ssh_key               = "${var.public_ssh_key}"
  tags                         = "${var.tags}"
  hostname_format              = "${var.hostname_format}"
  private_backend_address_pool = ["${module.pubagt-lb.private_backend_address_pool}"]
  public_backend_address_pool  = ["${module.pubagt-lb.public_backend_address_pool}"]
  subnet_id                    = "${var.subnet_id}"
}
