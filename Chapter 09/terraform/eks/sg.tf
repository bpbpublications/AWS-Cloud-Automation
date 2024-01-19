resource "aws_security_group" "demo-worker-group-one" {

    name_prefix = "demo-worker-group-one"

    vpc_id = module.vpc.vpc_id


    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"

        cidr_blocks = [

            "10.0.0.0/8"

        ]

    }

}

resource "aws_security_group" "demo-worker-group-two" {

    name_prefix = "demo-worker-group-two"

    vpc_id = module.vpc.vpc_id

 
    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"


        cidr_blocks = [

            "10.0.0.0/8"

        ]

    }

}

resource "aws_security_group" "all-demo-worker" {

    name_prefix = "all-demo-worker"

    vpc_id = module.vpc.vpc_id


    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"

        cidr_blocks = [

            "10.0.0.0/8"

        ]

    }
    
}
