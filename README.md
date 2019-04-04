[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-public-agents/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-public-agents/job/master/)
Azure DC/OS Public Agent Instances
==================================

This module creates typical public agent instances

EXAMPLE
-------

```hcl
module "dcos-public-agent-instances" {
 source  = "dcos-terraform/public-agents/azure"
 version = "~> 0.2.0"

 subnet_id = "myid"
 security_group_ids = ["sg-12345678"]"
 public_ssh_key = "~/.ssh/id_rsa.pub"

 num_public_agents = "2"
 ...
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin\_username | SSH User | string | n/a | yes |
| allow\_stopping\_for\_update | If true, allows Terraform to stop the instance to update its properties | string | `"true"` | no |
| custom\_data | User data to be used on these instances (cloud-init) | string | `""` | no |
| dcos\_instance\_os | Operating system to use. Instead of using your own AMI you could use a provided OS. | string | n/a | yes |
| dcos\_version | Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list. | string | n/a | yes |
| disk\_size | Disk Size in GB | string | n/a | yes |
| disk\_type | Disk Type to Leverage | string | `"Standard_LRS"` | no |
| hostname\_format | Format the hostname inputs are index+1, region, cluster_name | string | `"pubagt-%[1]d-%[2]s"` | no |
| image | Source image to boot from | map | `<map>` | no |
| location | Azure Region | string | n/a | yes |
| name\_prefix | Cluster Name | string | n/a | yes |
| network\_security\_group\_id | Security Group Id | string | `""` | no |
| num\_public\_agents | Specify the amount of public agents. These agents will host marathon-lb and edgelb | string | n/a | yes |
| resource\_group\_name | Name of the azure resource group | string | n/a | yes |
| ssh\_private\_key\_filename | Path to the SSH private key | string | `"/dev/null"` | no |
| ssh\_public\_key | SSH public key in authorized keys format (e.g. 'ssh-rsa ..') to be used with the instances. Make sure you added this key to your ssh-agent. | string | n/a | yes |
| subnet\_id | Subnet ID | string | n/a | yes |
| tags | Add custom tags to all resources | map | `<map>` | no |
| vm\_size | Azure virtual machine size | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| admin\_username | SSH User |
| instance\_nic\_ids | List of instance nic ids created by this module |
| ip\_configuration\_names | List of instance nic ids created by this module |
| prereq\_id | Prereq id used for dependency |
| private\_ips | List of private ip addresses created by this module |
| public\_ips | List of public ip addresses created by this module |

