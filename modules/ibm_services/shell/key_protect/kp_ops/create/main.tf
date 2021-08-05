

variable region {}
variable name {}
variable kp_instance_id {}

resource "shell_script" "create" {
  lifecycle_commands {
    create = file("${path.module}/scripts/create.sh")
    delete = file("${path.module}/scripts/delete.sh")
    read   = file("${path.module}/scripts/read.sh")
  }
 
  environment = {
    IBM_REGION     = var.region
    NAME           = var.name
    KP_INSTANCE_ID = var.kp_instance_id
  }
}

output "create" {
  value = shell_script.create.output
}
