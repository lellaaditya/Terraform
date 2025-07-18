# Terraform

Infrastructure as Code(IaC)

infrastructure management was typically a manual and time-consuming process before the Iac

1. **Manually Configure Servers**: Servers and other infrastructure components were often set up and configured manually, which could lead to inconsistencies and errors.

2. **Lack of Version Control**: Infrastructure configurations were not typically version-controlled, making it difficult to track changes or revert to previous states.

3. **Documentation Heavy**: Organizations relied heavily on documentation to record the steps and configurations required for different infrastructure setups. This documentation could become outdated quickly.

4. **Limited Automation**: Automation was limited to basic scripting, often lacking the robustness and flexibility offered by modern IaC tools.

5. **Slow Provisioning**: Provisioning new resources or environments was a time-consuming process that involved multiple manual steps, leading to delays in project delivery.
   
# Cloud Provided Iac

**Azure** - Azure Resource Manager templates

**AWS** - AWS CloudFormation

# Terraform only why?

Multi-Cloud Support: AWS, Azure, Google Cloud, etc

1. **Multi-Cloud Support**: Terraform is known for its multi-cloud support. It allows you to define infrastructure in a cloud-agnostic way, meaning you can use the same configuration code to provision resources on various cloud providers (AWS, Azure, Google Cloud, etc.) and even on-premises infrastructure. This flexibility can be beneficial if your organization uses multiple cloud providers or plans to migrate between them.

2. **Large Ecosystem**: Terraform has a vast ecosystem of providers and modules contributed by both HashiCorp (the company behind Terraform) and the community. This means you can find pre-built modules and configurations for a wide range of services and infrastructure components, saving you time and effort in writing custom configurations.

3. **Declarative Syntax**: Terraform uses a declarative syntax, allowing you to specify the desired end-state of your infrastructure. This makes it easier to understand and maintain your code compared to imperative scripting languages.

4. **State Management**: Terraform maintains a state file that tracks the current state of your infrastructure. This state file helps Terraform understand the differences between the desired and actual states of your infrastructure, enabling it to make informed decisions when you apply changes.

5. **Plan and Apply**: Terraform's "plan" and "apply" workflow allows you to preview changes before applying them. This helps prevent unexpected modifications to your infrastructure and provides an opportunity to review and approve changes before they are implemented.

6. **Community Support**: Terraform has a large and active user community, which means you can find answers to common questions, troubleshooting tips, and a wealth of documentation and tutorials online.

7. **Integration with Other Tools**: Terraform can be integrated with other DevOps and automation tools, such as Docker, Kubernetes, Ansible, and Jenkins, allowing you to create comprehensive automation pipelines.

8. **HCL Language**: Terraform uses HashiCorp Configuration Language (HCL), which is designed specifically for defining infrastructure. It's human-readable and expressive, making it easier for both developers and operators to work with.


# terminology and concepts

1. **Provider**: A provider is a plugin for Terraform that defines and manages resources for a specific cloud or infrastructure platform. 
Examples of providers include AWS, Azure(azurerm), Google Cloud,kubernetes and many others. Interacts with cloud 

2. **Resource**: A resource is a specific infrastructure component that you want to create and manage using Terraform. Resources can include virtual machines, databases, storage buckets, network components, and more. Each resource has a type and configuration parameters that you define in your Terraform code.

3. **Module**: A module is a reusable and encapsulated unit of Terraform code. Modules allow you to package infrastructure configurations, making it easier to maintain, share, and reuse them across different parts of your infrastructure. Modules can be your own creations or come from the Terraform Registry, which hosts community-contributed modules.

4. **Configuration File**: Terraform uses configuration files (often with a `.tf` extension) to define the desired infrastructure state. These files specify providers, resources, variables, and other settings. The primary configuration file is usually named `main.tf`, but you can use multiple configuration files as well.

5. **Variable**: Variables in Terraform are placeholders for values that can be passed into your configurations. They make your code more flexible and reusable by allowing you to define values outside of your code and pass them in when you apply the Terraform configuration.

6. **Output**: Outputs are values generated by Terraform after the infrastructure has been created or updated. Outputs are typically used to display information or provide values to other parts of your infrastructure stack.

7. **State File**: Terraform maintains a state file (often named `terraform.tfstate`) that keeps track of the current state of your infrastructure. This file is crucial for Terraform to understand what resources have been created and what changes need to be made during updates.

8. **Plan**: A Terraform plan is a preview of changes that Terraform will make to your infrastructure. When you run `terraform plan`, Terraform analyzes your configuration and current state, then generates a plan detailing what actions it will take during the `apply` step.

9. **Apply**: The `terraform apply` command is used to execute the changes specified in the plan. It creates, updates, or destroys resources based on the Terraform configuration.

10. **Workspace**: Workspaces in Terraform are a way to manage multiple environments (e.g., development, staging, production) with separate configurations and state files. Workspaces help keep infrastructure configurations isolated and organized.

# Install Terraform

## Windows

1. Install Terraform from the Downloads [Page](https://developer.hashicorp.com/terraform/downloads)

## Linux

- Follow the steps provided in the Downloads [Page](https://developer.hashicorp.com/terraform/downloads) for Linux.

## macOS

- Follow the steps provided in the Downloads [Page](https://developer.hashicorp.com/terraform/downloads) for macOS.

# Setup Terraform for Azure

Install az cli

az login

az account list

az account set --subscription="SUBSCRIPTION_ID"

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
```

# Configure the Microsoft Azure Provider
```hcl
provider "azurerm" {
  features {}

  subscription_id = "00000000-0000-0000-0000-000000000000"
}
```


# Modules

The advantage of using Terraform modules in your infrastructure as code (IaC) projects lies in improved organization, reusability, and maintainability. Here are the key benefits:

1. **Modularity**: Terraform modules allow you to break down your infrastructure configuration into smaller, self-contained components. This modularity makes it easier to manage and reason about your infrastructure because each module handles a specific piece of functionality, such as an EC2 instance, a database, or a network configuration.

2. **Reusability**: With modules, you can create reusable templates for common infrastructure components. Instead of rewriting similar configurations for multiple projects, you can reuse modules across different Terraform projects. This reduces duplication and promotes consistency in your infrastructure.

3. **Simplified Collaboration**: Modules make it easier for teams to collaborate on infrastructure projects. Different team members can work on separate modules independently, and then these modules can be combined to build complex infrastructure deployments. This division of labor can streamline development and reduce conflicts in the codebase.

4. **Versioning and Maintenance**: Modules can have their own versioning, making it easier to manage updates and changes. When you update a module, you can increment its version, and other projects using that module can choose when to adopt the new version, helping to prevent unexpected changes in existing deployments.

5. **Abstraction**: Modules can abstract away the complexity of underlying resources. For example, an EC2 instance module can hide the details of security groups, subnets, and other configurations, allowing users to focus on high-level parameters like instance type and image ID.

6. **Testing and Validation**: Modules can be individually tested and validated, ensuring that they work correctly before being used in multiple projects. This reduces the risk of errors propagating across your infrastructure.

7. **Documentation**: Modules promote self-documentation. When you define variables, outputs, and resource dependencies within a module, it becomes clear how the module should be used, making it easier for others (or your future self) to understand and work with.

8. **Scalability**: As your infrastructure grows, modules provide a scalable approach to managing complexity. You can continue to create new modules for different components of your architecture, maintaining a clean and organized codebase.

9. **Security and Compliance**: Modules can encapsulate security and compliance best practices. For instance, you can create a module for launching EC2 instances with predefined security groups, IAM roles, and other security-related configurations, ensuring consistency and compliance across your deployments.

# Terraform State File

Terraform is an Infrastructure as Code (IaC) tool used to define and provision infrastructure resources. The Terraform state file is a crucial component of Terraform that helps it keep track of the resources it manages and their current state. This file, often named `terraform.tfstate`, is a JSON or HCL (HashiCorp Configuration Language) formatted file that contains important information about the infrastructure's current state, such as resource attributes, dependencies, and metadata.

**Advantages of Terraform State File:**

1. **Resource Tracking**: The state file keeps track of all the resources managed by Terraform, including their attributes and dependencies. This ensures that Terraform can accurately update or destroy resources when necessary.

2. **Concurrency Control**: Terraform uses the state file to lock resources, preventing multiple users or processes from modifying the same resource simultaneously. This helps avoid conflicts and ensures data consistency.

3. **Plan Calculation**: Terraform uses the state file to calculate and display the difference between the desired configuration (defined in your Terraform code) and the current infrastructure state. This helps you understand what changes Terraform will make before applying them.

4. **Resource Metadata**: The state file stores metadata about each resource, such as unique identifiers, which is crucial for managing resources and understanding their relationships.

**Disadvantages of Storing Terraform State in Version Control Systems (VCS):**

1. **Security Risks**: Sensitive information, such as API keys or passwords, may be stored in the state file if it's committed to a VCS. This poses a security risk because VCS repositories are often shared among team members.

2. **Versioning Complexity**: Managing state files in VCS can lead to complex versioning issues, especially when multiple team members are working on the same infrastructure.

**Overcoming Disadvantages with Remote Backends (e.g., S3,Azure Storage):**

A remote backend stores the Terraform state file outside of your local file system and version control. Using Azure Storage as a remote backend is a popular choice due to its reliability and scalability. Here's how to set it up:

# provisioners 

1. **file Provisioner:**

   The `file` provisioner is used to copy files or directories from the local machine to a remote machine. This is useful for deploying configuration files, scripts, or other assets to a provisioned instance.

2. **remote-exec Provisioner:**

   The `remote-exec` provisioner is used to run scripts or commands on a remote machine over SSH or WinRM connections. It's often used to configure or install software on provisioned instances

3. **local-exec Provisioner:**

   The `local-exec` provisioner is used to run scripts or commands locally on the machine where Terraform is executed. It is useful for tasks that don't require remote execution, such as initializing a local database or configuring local resources
   

# secure Terraform

to manage sensitive information
- Azure Key Vault

# Resource Creation 

**Initialize Terraform**

In your terminal, navigate to the directory containing your Terraform configuration files and run:

```
terraform init
```

This command initializes the Terraform working directory, downloading any necessary provider plugins.

**Validation**

```
terraform validate
```
validates the configuration files in a directory.Validate runs checks that verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state

**Dry Run** 

```
terraform plan
```
creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure

**Apply the Configuration**

Run the following command to create the Azure resources defined in your Terraform configuration:

```
terraform apply
```

Terraform will display a plan of the changes it's going to make. Review the plan and type "yes" when prompted to apply it.

## Verify Resources

After Terraform completes the provisioning process, you can verify the resources created in the Azure Portal.

## Destroy Resources

If you want to remove the resources created by Terraform, you can use the following command:

```
terraform destroy
```
