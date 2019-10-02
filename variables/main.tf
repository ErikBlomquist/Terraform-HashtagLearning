## PROVIDER
provider "aws" {
    region = "us-west-2"
    profile = "admin-korkbots"
}

## STRINGS
variable "string" {
    type = "string"
    default = "Hello World!"
}

variable "multi-string" {
    type = "string"
    default = <<EOH

    line 1
    line 2
    line 3
    line 4
    EOH
}

## OUTPUTS
output "string-output" {
    value = "${var.string}"
}

output "multi-string-output" {
    value = "${var.multi-string}"
}

## MAPS
variable "mapexample" {
    type = "map"
    default = {
        "useast" = "ami1"
        "uswest" = "ami2"
    }
}

output "mapoutput" {
  value = "${var.mapexample["uswest"]}"
}

## LISTS
variable "my-cats" {
    type = "list"
    default = ["Lou", "Lily", "Pea", "Puss"]
}

output "list-output" {
  value = "${var.my-cats[0]}"
}

## BOOLEANS
variable "testbool" {
    default = "true"
}

### Output will be 0 (false) or 1 (true)
output "booloutput" {
    value = "${var.testbool}"
}

## INPUT
variable "input-var" {
    type = "string"
}

output "output-var" {
  value = "${var.input-var}"
}





