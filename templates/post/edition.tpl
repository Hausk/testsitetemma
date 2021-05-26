<!DOCTYPE html>
<html>
<head>
	<title>{$conf.siteName|escape}</title>
	<link rel="stylesheet" href="/CSS/bootstrap.css">
</head>
<body>
	<div class="container">
		<h3 class="p-2 text-center pt-3">Edition de: <span class="text-info">{$post.title}</span></h3>
		<form action="/post/enregistrer/{$id}" method="POST">
			<div class="modal-body">
				<div class="form-group d-flex">
					<input type="text" class="form-control me-1" name="author" value="{$author|escape}">
					<input type="text" class="form-control ms-1" name="title" value="{$post.title|escape}" id="title">
				</div>
				<div class="form-group">
					<label class="col-form-label mt-4" for="inputDefault">Contenu</label>
					<textarea class="form-control" name="content" id="content" rows="5">{$post.content|escape}</textarea>
				</div>
			</div>

	       		<div class="modal-footer">
	           		<button type="submit" class="btn btn-success">Valider</button>
	           		<a href="/post/liste" type="button" class="btn btn-danger" title="Annuler?">Annuler</a>
	       		</div>
		</form>
	</div>

</body>
</html>