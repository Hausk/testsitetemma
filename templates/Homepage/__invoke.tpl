<html>
<head>
    <title>{$conf.siteName|escape}</title>
    <link rel="stylesheet" href="../CSS/bootstrap.css">
</head>
<body>
        <div class="container d-flex flex-wrap mx-auto">

                <h1 class="w-100">Posts</h1>
                <div class="posts_container w-75 mx-auto flex-column">
                        {foreach $posts as $post}
                        <div class="card mb-3">
                                <h4 class="card-header">{$post.title|escape}</h4>
                                <div class="card-body">
                                        <h6 class="card-subtitle mb-2 text-muted">Ecrit par <span class="text-info">{$post.author|escape}</span></h6>
                                        <p class="card-text">{$post.content|escape}</p>
                                        <p class="text-muted text-end mb-0">{$post.pos_d_creation|escape}</p>
                                </div>
                        </div>
                        {/foreach}
                        <div class="d-flex">
                                <ul class="pagination mx-auto mt-3">
                                        <li class="page-item disabled">
                                                <a class="page-link" href="#">&laquo;</a>
                                        </li>
                                        {for $i=1 to $nbrPages}
                                        <li class="page-item active"> 
                                                <a href="/post/liste/{$i}" {if $i == $page}style="font-weight: bold;"{/if}>{$i}</a><
                                        </li>
                                        {/for}
                                        <li class="page-item">
                                            <a class="page-link" href="#">&raquo;</a>
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
                                                <form action="/" method="POST">

                                                        <div class="modal-body">
                                                                <div class="form-group d-flex">
                                                                        <input type="text" class="form-control me-1" name="posts_s_name" placeholder="Nom" id="name">
                                                                        <input type="text" class="form-control ms-1" name="posts_s_title" placeholder="Titre" id="title">
                                                                </div>
                                                                <div class="form-group">
                                                                        <label class="col-form-label mt-4" for="inputDefault">Contenu</label>
                                                                        <textarea class="form-control" name="posts_s_content" id="content" rows="5"></textarea>
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

        </div>

        <div class="btn btn-lg btn-secondary fixed-bottom py-3" data-toggle="modal" data-target="#add_modal">Ajouter</div>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>