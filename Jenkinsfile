
pipeline{
    stages{
        agent{
            label "dev"
        }
        stage("pull the code from scm"){
            steps{
               git branch: 'master', url: 'https://github.com/jaatbreak/simple_repo.git'
            }
        }
        stage("buildings the code"){
            steps{
            sh 'sudo docker build -t insta_app:$BUILD_TAG .'
			sh 'sudo docker tag insta_app:$BUILD_TAG amansingh12/insta_app:$BUILD_TAG'
            }
        }
        stage("push the image to docker"){
            steps{
                withCredentials([string(credentialsId: 'docker_hub', variable: 'docker_var')]){
                    sh 'sudo docker login -u amansingh12 -p $docker_var'
					sh 'sudo docker push amansingh12/insta_app:$BUILD_TAG'
                }
            }
        }
        stage("QAT team work"){
            steps{
                sh 'sudo docker run -dit -p 80:80 amansingh12/insta_app:$BUILD_TAG'
            }
        }
}
