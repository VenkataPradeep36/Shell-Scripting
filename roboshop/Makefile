help:		## Print Help Message
# @ using this means it is calling shell command
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

frontend:	## Install Frontend Component
	@sh components/frontend.sh

mongodb:	## Install MongoDB Component
	@sh components/mongodb.sh

catalogue:	## Install Catalogue Component
	@sh components/catalogue.sh

redis:		## Install Redis Component
	@sh components/redis.sh

user:		## Install User Component
	@sh components/user.sh

cart:		## Install Cart Component
	@sh components/cart.sh

mysql:		## Install MySQL Component
	@sh components/mysql.sh

shipping:	## Install Shipping Component
	@sh components/shipping.sh

rabbitmq:	## Install RabbitMQ Component
	@sh components/rabbitmq.sh

payment:	## Install Payment Component
	@sh components/payment.sh
