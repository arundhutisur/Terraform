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
    access_key = "ASIAW5XWLQKUOIVURGOC"
    secret_key = "Qg/mWOtH55zTDKrTY4ARZ4gmN49U0ov1hEFo+vy/"
    token = "FwoGZXIvYXdzEGsaDDw89IkwkYCV1OTwFSKvAcjX+2c/oLSlTClhgHdpajQ1/svIY9mgPA/b8riJ09zloIGgAKATRFhFnzOXdjFdxNROqROzK0NbpQkB6zBJYxA++jykO2EreSArtjXY3Pyf60D6kFOYchYi7dNCezleOSNcZ0EWNEewYTXVE8BNMhtG0oLOJ7jCZa7g0S18MWe8Gvv/8idopOKR7jHXDX0hPyisoGU5WAb7dwv2S82+Bfon1hXG9gQFkEDD/dDiPNgolP7WrgYyLWlPwnPxH3izZ4j6hgVxNHfukl/VAmRDv7lDHIG6hDQh/JaCLNqUKd9RaRzxNg=="
}