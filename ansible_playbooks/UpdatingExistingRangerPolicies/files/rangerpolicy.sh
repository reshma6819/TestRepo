#!/bin/bash

RangerIP="34.70.76.123:6080"
RangerAdminUsername="admin"
RangerAdminPassword="itt@123456"
RangerURL="http://${RangerIP}/service/public/api/policy/${PolicyNumber}"

PolicyDetails=$(curl -iv -u ${RangerAdminUsername}:${RangerAdminPassword} -H Content-type:application/json -X GET ${RangerURL} 2>&1)
temp_var_2=${PolicyDetails#*',"updatedBy":"Admin",'}
temp_var_2=${temp_var_2%',"permMapList"'*}
temp_var_3=${PolicyDetails%',"version"'*}
temp_var_3=${temp_var_3#*']}]'}
temp_var_4=',"permMapList"'
temp_var_5=${PolicyDetails#*'"permMapList"'}
temp_var_5=${temp_var_5%'}]'*}
temp_var_6="},"
temp_var_7=${NewAccessPermissions}
RequiredString="$temp_var_2$temp_var_3$temp_var_4$temp_var_5$temp_var_6$temp_var_7"
temp_var_8="'{"
temp_var_9="]}'"
FinalString="$temp_var_8$RequiredString$temp_var_9"
Result="curl -iv -u ${RangerAdminUsername}:${RangerAdminPassword} -H \"Content-Type: application/json\" -d ${FinalString} -X PUT ${RangerURL}"
eval "$Result" > /dev/null 2>&1
