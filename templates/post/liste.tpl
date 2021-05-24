<html>
<body>

        <h1>Posts</h1>
        <ul style="display: flex; flex-direction: column; list-style: none">
            {foreach $posts as $post}
                <li style="max-width: 25vw; margin: 5px auto; border: 1px solid black">
                    <p style="display: flex; justify-content: space-between;"><span>{$post.author|escape}</span><a href="/post/suppression/{$post.id}">x</a></p><br />
                    {$post.title|escape}<br />
                    {$post.content|escape}
                    {$post.id|escape}
                </li>
            {/foreach}
        </ul>

        <h2>Pagination</h2>
        <ul>
            {for $i=1 to $nbrPages}
                <li><a href="/post/liste/{$i}" {if $i == $page}style="font-size: 1.5rem"{/if}>{$i}</a></li>
            {/for}
        </ul>

        <h2>Message</h2>
        <form method="POST" action="/post/creation">
            <label>Nom</label><br/>
            <input type="text" name="author" value="{$post.author}"><br />

            <label>Titre</label><br />
            <input type="text" name="title" value={$post.title}><br />

            <label>Message</label><br />
            <textarea name="content" value={$post.content}></textarea><br /><br />

            <button type="submit">Envoyer</button>
        </form>
</body>
</html>
