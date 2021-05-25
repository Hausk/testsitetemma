<!DOCTYPE html>
<html>
<head>
	<title>{$conf.siteName|escape}</title>
	<link rel="stylesheet" href="/CSS/bootstrap.css">
</head>
<body>
	<h3>Edition de: {$post.title}</h3>
	<form action="/post/enregistrer/{$id}" method="POST">
		<label>Autheur:</label>
		<input type="text" name="author" value="{$author|escape}"/>
		<label>Titre:</label>
		<input type="text" name="title" value="{$post.title|escape}"/><br />
		<label>Contenu:</label>
		<textarea name="content">{$post.content|escape}</textarea>
		<button type="submit">Modifier</button>
	</form>

</body>
</html>