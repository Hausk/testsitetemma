<!DOCTYPE html>
<html>
<head>
	<title>Page de connexion</title>
	<link rel="stylesheet" href="/CSS/bootstrap.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous"/>
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-5">
                <div class="container-fluid">
                        <a class="navbar-brand" href="/post/liste">Liste des posts</a>
                        <a href="/auth/login">Login</a>
                </div>
        </nav>
</head>
<body>
	<h1>Page de connexion</h1>

	<form method="POST" action="/auth/check">
		<input type="text" name="username" /><br />
		<input type="password" name="password"/><br />
		<button type="submit" class="btn btn-success">Se connecter</button>
	</form>

	{if $error}<h3>Le mot de passe est incorrect !</h3>{/if}
</body>
</html>