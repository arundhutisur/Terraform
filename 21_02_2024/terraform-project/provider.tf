terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
    access_key = "ASIAW5XWLQKUGPLCA5XX"
    secret_key = "d9qs2KOf4QR/KxkA7roN0jcv7hr0BEOR1qDmfGuL"
    token = "FwoGZXIvYXdzEGsaDAyhI32F6BCYVT599SKvAQLN97krTJwgobp8lgHgEKk78gOb/CloQrvozoWdi6wEp0GjSeMTHdS+yLhO/Z7yDinfcprluFhCR9Hk07Zg9BZhKw0D1/VzSXPSxaGnCHHxxm2tCV0YrtO5IdinI4JnNY4czx6oIPOswc1aEwoOMiphcFtoQ/757RI1YN72x5csKRF4p8ap5akI6q0f0Eyg8pGQeJNbtPTsFu8T3WOW/imWVRIwOBZLXCggqwEh0YYo3JHXrgYyLfXZsx2azGN104T+yeWUn7MeUAfTetfWEvxazJp36+GByN4rWhoqbPFnlfPq0g=="
}