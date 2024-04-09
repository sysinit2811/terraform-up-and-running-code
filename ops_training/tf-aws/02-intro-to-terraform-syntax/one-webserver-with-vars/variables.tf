variable "number_example" {
  description = "an example of a number variable in terraform"
  type = number
  default = 42
}

variable "list_example" {
  description = "an example of a list in Terraform"
  type = list
  default = ["a","b","c"]
}

variable "list_numeric_example" {
  description = "an example of a numeric list in Terraform"
  type = list(number)
  default = [ 1,2,3 ]
}