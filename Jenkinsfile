pipeline {
    
    agent any
    stages{
	stage ('checkout') {
	    steps{
		    //git url: 'https://github.com/raamstar/simple-reactjs-app.git'
		    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/AditPinheiro/react-js-quick-food-delivery-website.git']]])
	}
	}
	    
	stage('Submit Stack') {
            steps {
		    //powershell "echo $env.WORKSPACE"
		    //withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'ACCESS_KEY_ID', credentialsId: 'AWS-IAM', secretKeyVariable: 'SECRET_ACCESS_KEY']]) {	     
			//	    powershell "echo $env.WORKSPACE"
			//	    powershell "aws cloudformation create-stack --stack-name s3bucket --template-body file://$env.WORKSPACE/stack.json --region 'us-east-1'"
		//    }
		    script{
			
			    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'ACCESS_KEY_ID', credentialsId: 'AWS_IAM', secretKeyVariable: 'SECRET_ACCESS_KEY']]) {
			   
		    // {
		     
				    sudo powershell "echo $env.WORKSPACE"
				    sudo powershell "aws cloudformation create-stack --stack-name s3bucket --template-body file://$env.WORKSPACE/stack.json --region 'us-east-1'"
		     sh "sudo -su"	    
		     sh "apt-get update -qq"
        	     sh "apt-get install -y apt-transport-https ca-certificates"
                     sh "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"
                     sh "echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list"
                     sh "apt-get update -qq"
                     sh "apt-get purge lxc-docker || true"
                     
         	     sh "apt-get -y install docker-engine"
        	     sh "usermod -aG docker ubuntu"
        	     sh "mkdir -p /etc/systemd/system/docker.service.d"
        	   
        	     sh "systemctl daemon-reload"
                     sh "systemctl restart docker"
        	     sh "git init"
        	     sh "git clone https://github.com/raamstar/simple-reactjs-app.git"
        	     sh "docker build . -t react-app"
        	     sh "docker run react-app"    
		   }
		 }	    
              }
          }    
  }
}
