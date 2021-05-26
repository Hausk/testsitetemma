<html>
<head>
        <title>{$conf.siteName|escape}</title>
        <link rel="stylesheet" href="/CSS/bootstrap.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous"/>
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-5">
                <div class="container-fluid">
                        <h2 class="navbar-brand" href="#">Posts</h2>
                        <a href="/auth/login">Login</a>
                </div>
        </nav>
        <div class="container d-flex flex-wrap mx-auto flex-column">

                <div class="posts_container w-75 mx-auto flex-column">
                        {foreach $posts as $post}
                                <div class="card mb-3">
                                        <div class="card-header d-flex justify-content-between"><h4 class="my-auto text-capitalize">{$post.title|escape}</h4>
                                                <a href="/post/supprimer/{$post.id}" class="btn btn-danger" title="Supprimer le post">
                                                        <i class="fas fa-trash fa-lg"></i>
                                                </a>
                                        </div>
                                        <div class="card-body">
                                                <h6 class="card-subtitle mb-2 text-muted">Ecrit par <span class="text-info text-capitalize">{$post.author|escape}</span></h6>
                                                <p class="card-text">{$post.content|escape}</p>
                                                <div class="d-flex justify-content-between">
                                                        <a class="btn btn-warning" href="/post/edition/{$post.id}" title="Editer le post">
                                                                <i class="fas fa-edit fa-lg"></i>
                                                        </a>
                                                        <p class="text-muted my-auto">{$post.dateCreation|escape}</p>
                                                </div>
                                        </div>
                                </div>
                        {/foreach}
                </div>

                <div class="d-flex mb-5">
                        <ul class="pagination mx-auto mt-3">
                                <li class="page-item {if $page == 1}disabled{/if}">
                                        <a class="page-link" href="/post/liste/{$i--}">&laquo;</a>
                                </li>
                                {for $i=1 to $nbrPages}
                                        <li class="page-item {if $i == $page}active{/if}">
                                                <a href="/post/liste/{$i}" class="page-link">{$i}</a>
                                        </li>
                                {/for}
                                <li class="page-item {if $page == $nbrPages}disabled{/if}">
                                        <a class="page-link" href="/post/liste/{$page+1}">&raquo;</a>
                                </li>
                        </ul>
                </div>

                <div id="add_modal" class="modal fade">
                        <div class="modal-dialog" role="document" style="max-width: 70vw !important">
                                <div class="modal-content mx-auto mt-5">
                                        <div class="modal-header">
                                                <h5 class="modal-title">Création d'un nouveau post</h5>
                                                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true"></span>
                                                </button>
                                        </div>
                                        <form action="/post/enregistrer" method="POST">

                                                <div class="modal-body">
                                                        <div class="form-group d-flex">
                                                                <input type="text" class="form-control me-1" name="author" value="{$author|escape}">
                                                                <input type="text" class="form-control ms-1" name="title" placeholder="Titre" id="title">
                                                        </div>
                                                        <div class="form-group">
                                                                <label class="col-form-label mt-4" for="inputDefault">Contenu</label>
                                                                <textarea class="form-control" name="content" id="content" rows="5" placeholder="Tapez votre message ici"></textarea>
                                                        </div>
                                                </div>

                                                <div class="modal-footer">
                                                        <button type="submit" class="btn btn-success">Valider</button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                                                </div>
                                        </form>
                                </div>
                        </div>
                </div>

        </div>

        <div class="btn btn-lg btn-secondary w-100 py-3" data-toggle="modal" data-target="#add_modal">Ajouter</div>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>