<html>
<body>

        <h1>Posts</h1>
        <ul style="display: flex; flex-direction: column; list-style: none">
                {foreach $posts as $post}
                        <li style="width: 25vw; margin: 5px auto; padding: 7px; border: 1px solid black">
                                <p style="display: flex; justify-content: space-between;"><span>{$post.author|escape}</span><a href="/post/supprimer/{$post.id}">x</a></p><br />
                                {$post.title|escape}<br />
                                {$post.content|escape}<br />
                                <p style="display: flex; justify-content: space-between;"><span>{$post.dateCreation|escape}</span><a href="/post/edition/{$post.id}">M</a>
                        </li>
                {/foreach}
        </ul>

        <h2>Pagination</h2>
        <ul style="list-style: none;">
                {for $i=1 to $nbrPages}
                        <li><a href="/post/liste/{$i}" {if $i == $page}style="font-size: 1.5rem"{/if}>{$i}</a></li>
                {/for}
        </ul>
        <h2>Message</h2>
        <form method="POST" action="/post/enregistrer">
                <label>Nom</label><br/>
                <input type="text" name="author" value="{$author|escape}" /><br />

                <label>Titre</label><br />
                <input type="text" name="title" placeholder="titre" /><br />

                <label>Message</label><br />
                <textarea name="content" placeholder="Entrez votre message" /></textarea><br /><br />

                <button type="submit">Envoyer</button>
        </form>
</body>
</html>