<?php

use \Temma\Base\Log as TµLog;

class Posts extends \Temma\Web\Controller {

	const POST_PER_PAGE = 10;

	/**
	 * Affichage de la liste des posts.
	 * @param int $page Numéro de la page. Page 1 par défaut.
	 */
	public function liste(int $page=1) {
		$this['posts'] = $this->_loader->PostsDao->getList($page, self::POST_PER_PAGE);
		$this['page'] = $page;
		$postsCount = $this->_loader->PostsDao->getCount();
		$this['nbrPages'] = ceil($postCount / self::POST_PER_PAGE) + (($postCount % self::POST_PER_PAGE) ? 1 : 0);
	}
	
	public function creation() {
		$this->_redirect('/post/liste');
		$name = trim($_POST['name'] ?? null);
		$title = trim($_POST['title'] ?? null);
		$content = trim($_POST['content'] ?? null);
		
		$this->_loader->PostsDao->create($name, $title, $content);
	}
}

