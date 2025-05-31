pipeline
{
	agent any
	stages
	{
		stage('Code Checkout')
		{
			steps
			{
				git 'https://github.com/nimmikac/igp-nimmikac.git'
			}
		}
		
		stage('Code Compile')
		{
			steps
			{
				sh 'mvn compile'
			}
		}
		
		stage('Unit Test')
		{
			steps
			{
				sh 'mvn test'
			}
		}
		
		stage('Code Packaging')
		{
			steps
			{
				sh 'mvn package'
			}
		}
	}
}