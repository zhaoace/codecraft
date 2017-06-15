#!/usr/bin/env groovy

withSplunkWrapNode("master") {


    stage("mypassword"){
      withCredentials([usernamePassword(credentialsId: 'testlalala', passwordVariable: 'password', usernameVariable: 'username')]) {
        sh """ echo username: ${username} """
        sh """ echo password: ${password} """
        sh """
        if [[ '${username}'='lalala' ]]; then
           echo "username equal!"
        fi
        """
        sh """
        if [[ '${password}'='xxx' ]]; then
           echo "password equal!"
        fi
        """

        sh """
cat > temp.run.sh  << 'eof'
echo \$0
echo \$1
echo \$2
echo username?
if [[ '\$1'='lalala' ]]; then
   echo "username equal!"
fi
eof

cat temp.run.sh
bash temp.run.sh ${username} var2_here
        """
      }
    }

}

