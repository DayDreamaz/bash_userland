output "public_dns" {
    value = aws_instance.meta_dev_instance.public_dns
    description =  "IP address of meta dev server"
}

