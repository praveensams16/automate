

def adds(name)
	{
	return name+1
	}

pipeline {
        agent none

		environment {
		      s=10
			  }

        parameters {
                                string(defaultValue: "latest", description: 'Enter the tag name', name: 'tags')
                }

	stages {
	

	stage("moving the files") {

  		agent { node { label 'nexus' } }

	        steps {

			script {
			   s=adds(5)
			   println(s)
		sh '''
		  echo  $s
		  '''
		  }
		  }
		  }
		 }

		 }



