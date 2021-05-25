<?php

use \Temma\Base\Log as TµLog;

/**
 * Contrôleur de gestion des posts.
 */
class Post extends \Temma\Web\Controller {
	/** Constante : nombre de posts par page. */
	const NBR_POSTS_PER_PAGE = 5;

	/**
	 * Affichage de la liste des posts.
	 * @param	int	$page	(optionnel) Numéro de la page. Page 1 par défaut.
	 */
	public function liste(int $page=1) {
		$this['posts'] = $this->_loader->PostDao->getList($page, self::NBR_POSTS_PER_PAGE);
		$this['page'] = $page;
		$postsCount = $this->_loader->PostDao->getCount();
		$this['nbrPages'] = ceil($postsCount / self::NBR_POSTS_PER_PAGE) + (($postsCount % self::NBR_POSTS_PER_PAGE) ? 1 : 0);
		$this['author'] = $this->_session['author'];
	}
	/**
	 * Création ou mise à jour d'un post.
	 * Récupère les informations suivantes en POST :
	 * - Nom de l'auteur.
	 * - Titre du post.
	 * - Contenu du post.
	 * @param	?int	$id	(optionnel) Identifiant du post à mettre à jour. Crée un nouveau post si non fourni.
	 */
	public function enregistrer(?int $id=null) {
		$this->_redirect('/post/liste');
		$author = trim($_POST['author'] ?? null);
		$title = trim($_POST['title'] ?? null);
		$content = trim($_POST['content'] ?? null);
		
		$this->_session['author'] = $author;
		// vérification des paramètres
		if (!$author || !$title || !$content) {
			TµLog::l("Paramètre vide.");
			return;
		}
		// ajout ou modification du post
		if (!$id) {
			$this->_loader->PostDao->create($author, $title, $content);
		} else {
			$this->_loader->PostDao->update($id, $author, $title, $content);
		}
	}

	/**
	 * Suppression d'un post.
	 * On récupère l'id du Post :
	 * @param    int    $id    identité du post
	 */
	public function supprimer(int $id) {
		$this->_loader->PostDao->remove($id);
		$this->_redirect('/post/liste');
	}

	/**
	 * Edition d'un post.
	 * On récupère l'id du Post,
	 * @param    int    $id    identité du post
	 */
	public function edition(int $id) {
		$this['id'] = $id;
		$this['post'] = $this->_loader->PostDao->get($id);
		$this['author'] = $this->_session['author'];
	}

}

