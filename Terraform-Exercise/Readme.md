Terraform practice architecture:

1 vpc
	6 subnets
		3 private
			ec2 instance (backend) [user ssh] [permessi per andare solo in lettura su un bucket specifico -> da creare (privato)]
		3 public
			ec2 instance (bastion) [user ssh] [reachable from instance connect]

	module
		ec2_instance