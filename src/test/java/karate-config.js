function fn()
{
	var config = 
	{
		name : "Raghav",
		baseUrl: 'https://reqres.in/api'
	};
	
	var env = karate.env
	karate.log('The value of the env is: ', env)
	
	if(env == 'qa')
	{
		config.baseUrl = 'https://reqres.in/qa'
	}
	else if(env == 'dev') 
	{
		config.baseUrl = 'https://reqres.in/dev'
	}
	else
	{
		config.baseUrl = 'https://reqres.in/api'	
	}
	
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	
	return config;
}