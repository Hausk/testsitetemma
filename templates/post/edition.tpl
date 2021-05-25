<!DOCTYPE html>
<html>
<head>
	<title>{$conf.siteName|escape}</title>
</head>
<body>
	<h3>Edition</h3>
	<form action="/post/enregistrer/{$id}" method="POST">
		<input type="text" name="title" value="{$post.title"/>
		<textarea name="content" value="{$post.content}"></textarea>
		<button type="submit">Modifier</button>
	</form>

</body>
</html>