#!/bin/bash

echo "Update Decision Center configurations"

if [ -n "$DECISIONSERVERCONSOLE_NAME" ]
then
  echo "Update decision server console name to $DECISIONSERVERCONSOLE_NAME in decisioncenter-configuration.properties"
	sed -i 's|odm-decisionserverconsole|'$DECISIONSERVERCONSOLE_NAME'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
fi
if [ -n "$DECISIONRUNNER_NAME" ]
then
  echo "Update decision runner name to $DECISIONRUNNER_NAME in decisioncenter-configuration.properties"
	sed -i 's|odm-decisionrunner|'$DECISIONRUNNER_NAME'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
fi

if [ -n "$ENABLE_TLS" ]
then
 echo "Update decision server and runner protocol to https in decisioncenter-configuration.properties"
        sed -i 's|protocol|'https'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
else
 echo "Update decision server and runner protocol to http in decisioncenter-configuration.properties"
        sed -i 's|protocol|'http'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
fi

if [ -n "$DECISIONSERVERCONSOLE_PORT" ]
then
  echo "Update decision server console port to $DECISIONSERVERCONSOLE_PORT in decisioncenter-configuration.properties"
        sed -i 's|decisionserverconsole-port|'$DECISIONSERVERCONSOLE_PORT'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
else
  echo "Update decision server console port to default 9080 in decisioncenter-configuration.properties"
        sed -i 's|decisionserverconsole-port|'9080'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
fi
if [ -n "$DECISIONRUNNER_PORT" ]
then
  echo "Update decision runner port to $DECISIONRUNNER_PORT in decisioncenter-configuration.properties"
        sed -i 's|decisionrunner-port|'$DECISIONRUNNER_PORT'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
else
  echo "Update decision runner port to default 9080 in decisioncenter-configuration.properties"
        sed -i 's|decisionrunner-port|'9080'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
fi

if [ -s "/config/auth/ldap-configurations.xml" ] 
then
  echo "Update LDAP synchronization mode to users in decisioncenter-configuration.properties"
  sed -i 's|ldap-sync-mode|'users'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
  sed -i 's|ldap-file|'\/opt\/ibm\/wlp\/usr\/servers\/defaultServer\/auth\/ldap-configurations.xml'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
else
  echo "Update LDAP synchronization mode to none in decisioncenter-configuration.properties"
  sed -i 's|ldap-sync-mode|'none'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
  sed -i 's|ldap-file|''|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
fi

if [ -s "/config/auth/group-security-configurations.xml" ] 
then
  sed -i 's|group-file|'\/opt\/ibm\/wlp\/usr\/servers\/defaultServer\/auth\/group-security-configurations.xml'|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
else
  sed -i 's|group-file|''|g' $APPS/decisioncenter.war/WEB-INF/classes/config/decisioncenter-configuration.properties
fi
