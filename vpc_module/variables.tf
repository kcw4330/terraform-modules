// 변수 블록
variable "vpc_cidr" {
  type = string
}
variable "pjt_name" {
  type = string
}
# variables.tf
variable "subnets" {
  description = "List of subnet configurations"
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
}
