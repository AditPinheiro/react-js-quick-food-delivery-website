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
		    
					script{
								echo "Hello world. this is my lame pipeline"
							       sh "apt-get update -qq"
							 sh "apt install openjdk-8-jdk -y"
							 
							 sh "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -"    
							 sh "add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
							 sh "apt-get update"
							 sh "apt-cache policy docker-ce"
							 sh "apt-get install -y docker-ce"
							 sh "systemctl status docker"
							 sh "usermod -aG docker ubuntu"
				 
							 sh "git init"
							 sh "git clone https://github.com/AditPinheiro/react-js-quick-food-delivery-website.git"
							 sh "docker build . -t food-app"
							 sh "docker run food-app"    
						}	    
				}
          }    
  }
}
