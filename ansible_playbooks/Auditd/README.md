Purpose:
Using this playbook we can add auditd rules to check if any changes have been made in the files whose paths are specified in services.json file.


Usage:
To change any of the default values of auditd.conf, define the variable and it's value in regex.yml
Example:
num_logs: 10


To add file paths for creating auditctl rules, add the path in services.json
Example:
{
service_list: 
[
/etc/resolv.conf,
/etc/my.cnf
]
}


Use the below command to run the playbook:
ansible-playbook ConfiguringAuditd.yml -e @services.json

