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
	}
	/**
	 * Création d'un nouveau post.
	 * Récupère les informations suivantes en POST :
	 * - Nom de l'auteur.
	 * - Titre du post.
	 * - Contenu du post.
	 */
	public function creation() {
		$this->_redirect('/post/liste/1');
		$author = trim($_POST['author'] ?? null);
		$title = trim($_POST['title'] ?? null);
		$content = trim($_POST['content'] ?? null);
		if (!$author || !$title || !$content) {
			TµLog::log('testsite', 'DEBUG', "Données vides.");
			return;
		}
		$this->_loader->PostDao->create($author, $title, $content);
	}

	/**
	 * Suppression d'un post.
	 * On récupère l'id du Post :
	 * @param int $id identité du post
	 */
	public function suppression($id) {
		$this->_redirect('/post/liste/1');
		$this->_loader->PostDao->delete($id);
	}
}

