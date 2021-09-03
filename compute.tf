resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = "example-resources"
  location            = "EastUS2"
  size                = "Standard_F2"
  admin_username      = "adminuser"
#   network_interface_ids = var.network_interface_ids

  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyMr12dUmP2stWOWlQ0wdPHILOBXm2TzJWqOu5bUEi0vKxaF/Vqb1T5CN9zu3Mk6H8g8050MKzi2oX3Cmn8nsr7obYYuQVzbYz1mnWfIV1BJ3SO1I5pqMi3luX1sO5OcsWEHcp9msLLfSg9h5hNYYv+efc9Grsx2Jvvi3Gr6dGiRZV3z4pQ3bZ6ca4ofzsfVqEuvPG0VUZuUKwyRFddOSHi/asymGQH/HMBS+dWg8DiAKKkkutjMXwK0AXgfuFk0TqUQoqqS2ZQm231dTWhf8A0ExNxIAFgsu7fZTZVBLVcV0SyHMMek3abyw8HrkZRVw6G9z35r5AFiJr8eg0la2HAn/DNs9iqJLxj2oOtuMa0ZBkuyhJm0oFFCSWJ1ewXgAMQ6CSRKKPIzI6muhdB/4qEyEyJhJ9BLclt8CrTGv0LGtIoX6nI5Z9y5znOUMN3dYuByIBBoghShn65ZYDXA5UxIsX/fgVUvU9oQbfoalbzgIDXde3JPKI8sDLsLbp1iFnam6gMOjxAF+wuwzK3aaM/GJeD9C1RFhio7QBA+UPrqzYOXc7dLl9eZtjoZtpBjTcFtJPKxxPRmOkHxwHgBwVCHeekoBqKE3E5TggZgIVHA2fPaBBJkxMwwvWd4TF/8KxyFJSrxQQGu7bdbbgJlZo41m6bhjVIm81MBuVGVfEcw=="
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
