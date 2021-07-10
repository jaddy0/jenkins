pipeline{
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages{
    stage('S3 create Bucket'){
      steps{
        script{
          createS3Bucket('terraform-statefile2021')
        }
      }
    }
    stage('terraform init and apply - dev'){
      steps {
        sh returnStatus: true, script: 'terraform workspace new dev'
        sh "terraform init"
        sh "terraform apply -var-file=dev.tfvars --auto-approve"
    }
  }

    stage('terraform init and apply - prod'){
      steps {
        sh returnStatus: true, script: 'terraform workspace new prod'
        sh "terraform init"
        sh "terraform apply -var-file=prod.tfvars --auto-approve"
      }
    }
  }
}

def getTerraformPath(){
  def tfHome = tool name: 'terraform-12', type: 'terraform'
  return tfHome
}

def createS3Bucket(bucketName){
  sh "aws s3 mb {bucketName} --region=us-east-1"
}
