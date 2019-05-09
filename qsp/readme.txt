quick server provisioning

Steps to install:

1. Edit 'inventory' changing the inventory IPs, passwords, and if you want to, the hostnames (fqdn, short, made-up are acceptable; changes need to be made to hostnames in ?server*.yml)
2. Edit 1server.yml or 2servers.yml for software versions and project/user/database names, or just
	sed -i orig -e "s/newproject/$AWESOMEPROJECT/g" 1server.yml 
3. Run ./init_1server.sh which should finish the job and spit out a list of credentials (also with ./listcreds.sh)

4. Deploy awesome new project
5. ...Demo
6. ...Sell
7. Profit?!
