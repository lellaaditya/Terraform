# HashiCorp Certified: Terraform Associate - Hands-On Labs by Udemy
Terraform Basics

Terraform commands
```
--  terraform init
    terraform validate 
    terraform plan
    terraform apply
    terraform destory
```
verify tf installation

terraform -version
terraform -help

# terraform init
Initializing your workspace is used to initialize a working directory containing Terraform configuration
files

The terraform init command initializes a working directory containing configuration files and installs plugins for required providers

Note: Terraform also has the concept of planning out changes to a file. This is useful to ensure
you only apply what has been planned previously. Try running a plan again but this time passing
an -out flag as shown below.
```
terraform plan -out myplan
```
Run the command as shown below to run a planned destroy:
```
terraform plan -destroy
```
Inspect the state
```
Terraform show
```
To review the information in your state file,
```
Terraform state list
```
