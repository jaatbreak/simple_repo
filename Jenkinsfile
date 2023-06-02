pipeline{
    agent any 
    stages{
        stage("scm"){
            agent{
                label "dev"
            }
            steps{
                git 'https://github.com/jaatbreak/simple_repo.git'
            }
        }
        stage("installing the docker in a node"){
            agent{
                label "dev"
            }
            steps{
                build quietPeriod: 30, job: 'job-1'
            }
                
            
        }
        stage("Building the image of docker web"){
            agent{
                label "dev"
            }
            steps{
                sh "sudo docker build -t insta_web:$BUILD_TAG ."
                sh 'sudo docker tag insta_web:$BUILD_TAG amansingh12/insta_pipeline:$BUILD_TAG'
            }
        }
        stage("DockerHub Pushing the Image"){
            agent{
                label "dev"
            }
            steps{
                    
                    build propagate: false, job: 'job-2'
		    sh 'sudo docker push amansingh12/insta_pipeline:$BUILD_TAG'                                                                               
            }
        }
        stage("Testing the Docker Container"){
            agent{
                label "dev"
            }
            steps{
                sh 'sudo docker rm -f $(sudo docker ps -a -q)'
				sh 'sudo docker run -dit -p 80:80  amansingh12/insta_pipeline:$BUILD_TAG'
            }
        }
    }
}
